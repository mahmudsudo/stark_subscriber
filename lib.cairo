# SPDX-License-Identifier: MIT
# This is a simple subscription manager contract in Cairo for StarkNet

@storage_var
func subscriptions(id: felt) -> (subscriber: felt, start_time: felt, duration: felt, is_active: felt):
end

@external
func create_subscription(duration: felt):
    let (id) = get_next_subscription_id()
    let (caller) = get_caller_address()
    
    # Store the new subscription
    subscriptions.write(id, (caller, get_block_timestamp(), duration, 1))
    
    emit SubscriptionCreated(id, caller, duration)
    return ()

@external
func cancel_subscription(id: felt):
    let (subscriber, start_time, duration, is_active) = subscriptions.read(id)
    let (caller) = get_caller_address()
    
    assert subscriber == caller, "Not the subscriber"
    assert is_active == 1, "Subscription is not active"
    
    # Mark the subscription as inactive
    subscriptions.write(id, (subscriber, start_time, duration, 0))
    
    emit SubscriptionCancelled(id)
    return ()

@view
func is_subscription_active(id: felt) -> (active: felt):
    let (subscriber, start_time, duration, is_active) = subscriptions.read(id)
    let current_time = get_block_timestamp()
    
    if is_active == 1 and current_time < start_time + duration:
        return (1)  # Active
    else:
        return (0)  # Inactive

# Helper function to get the next subscription ID
func get_next_subscription_id() -> (id: felt):
    # Implement logic to retrieve the next subscription ID
    # This could be a counter stored in storage
    return (0)  # Placeholder

# Event declarations
@event
func SubscriptionCreated(id: felt, subscriber: felt, duration: felt):
end

@event
func SubscriptionCancelled(id: felt):
end

