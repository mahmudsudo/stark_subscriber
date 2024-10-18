# Subscription Manager Contract

This is a simple subscription manager smart contract implemented in Cairo for StarkNet. It allows users to create, manage, and check the status of their subscriptions.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Functions](#functions)
- [Events](#events)
- [License](#license)

## Overview

The Subscription Manager contract enables users to create subscriptions with a specified duration, cancel their subscriptions, and check if their subscriptions are active. It utilizes StarkNet's capabilities to manage state and events efficiently.

## Features

- Create a new subscription
- Cancel an existing subscription
- Check if a subscription is active
- Event logging for subscription creation and cancellation

## Installation

To deploy and interact with this contract, you need to have the following prerequisites:

- [Cairo](https://www.cairo-lang.org/docs/installation.html) installed on your machine.
- A StarkNet account to deploy the contract.

Clone the repository:



## Usage

### Deploying the Contract

1. Compile the contract using Cairo.
2. Deploy the contract to the StarkNet network using your preferred method (e.g., using the StarkNet CLI).

### Interacting with the Contract

Once deployed, you can interact with the contract using the following functions:

## Functions

### `create_subscription(duration: felt)`

- **Description**: Creates a new subscription with the specified duration.
- **Parameters**:
  - `duration`: The duration of the subscription in seconds.
- **Returns**: None.

### `cancel_subscription(id: felt)`

- **Description**: Cancels an existing subscription if the caller is the subscriber.
- **Parameters**:
  - `id`: The ID of the subscription to cancel.
- **Returns**: None.

### `is_subscription_active(id: felt) -> (active: felt)`

- **Description**: Checks if a subscription is active.
- **Parameters**:
  - `id`: The ID of the subscription to check.
- **Returns**: 
  - `1` if the subscription is active, `0` if inactive.

## Events

### `SubscriptionCreated(id: felt, subscriber: felt, duration: felt)`

- **Description**: Emitted when a new subscription is created.
- **Parameters**:
  - `id`: The ID of the created subscription.
  - `subscriber`: The address of the subscriber.
  - `duration`: The duration of the subscription.

### `SubscriptionCancelled(id: felt)`

- **Description**: Emitted when a subscription is cancelled.
- **Parameters**:
  - `id`: The ID of the cancelled subscription.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.