# Stake token rev 3

Repository contains a new revision of `StakedTokenV3` and `StakedAaveV3` with improved slashing mechanism and updated to solc 0.8.

## Storage layout

### stkAAVE Before

| Name                              | Type                                                                                   | Slot | Offset | Bytes | Contract                                                                                                          |
| --------------------------------- | -------------------------------------------------------------------------------------- | ---- | ------ | ----- | ----------------------------------------------------------------------------------------------------------------- |
| \_balances                        | mapping(address => uint256)                                                            | 0    | 0      | 32    | src/etherscan/mainnet_0xe42f02713aec989132c1755117f768dbea523d2f/StakedTokenV2Rev3/Contract.sol:StakedTokenV2Rev3 |
| \_allowances                      | mapping(address => mapping(address => uint256))                                        | 1    | 0      | 32    | src/etherscan/mainnet_0xe42f02713aec989132c1755117f768dbea523d2f/StakedTokenV2Rev3/Contract.sol:StakedTokenV2Rev3 |
| \_totalSupply                     | uint256                                                                                | 2    | 0      | 32    | src/etherscan/mainnet_0xe42f02713aec989132c1755117f768dbea523d2f/StakedTokenV2Rev3/Contract.sol:StakedTokenV2Rev3 |
| \_name                            | string                                                                                 | 3    | 0      | 32    | src/etherscan/mainnet_0xe42f02713aec989132c1755117f768dbea523d2f/StakedTokenV2Rev3/Contract.sol:StakedTokenV2Rev3 |
| \_symbol                          | string                                                                                 | 4    | 0      | 32    | src/etherscan/mainnet_0xe42f02713aec989132c1755117f768dbea523d2f/StakedTokenV2Rev3/Contract.sol:StakedTokenV2Rev3 |
| \_decimals                        | uint8                                                                                  | 5    | 0      | 1     | src/etherscan/mainnet_0xe42f02713aec989132c1755117f768dbea523d2f/StakedTokenV2Rev3/Contract.sol:StakedTokenV2Rev3 |
| \_votingSnapshots                 | mapping(address => mapping(uint256 => struct GovernancePowerDelegationERC20.Snapshot)) | 6    | 0      | 32    | src/etherscan/mainnet_0xe42f02713aec989132c1755117f768dbea523d2f/StakedTokenV2Rev3/Contract.sol:StakedTokenV2Rev3 |
| \_votingSnapshotsCounts           | mapping(address => uint256)                                                            | 7    | 0      | 32    | src/etherscan/mainnet_0xe42f02713aec989132c1755117f768dbea523d2f/StakedTokenV2Rev3/Contract.sol:StakedTokenV2Rev3 |
| \_aaveGovernance                  | contract ITransferHook                                                                 | 8    | 0      | 20    | src/etherscan/mainnet_0xe42f02713aec989132c1755117f768dbea523d2f/StakedTokenV2Rev3/Contract.sol:StakedTokenV2Rev3 |
| lastInitializedRevision           | uint256                                                                                | 9    | 0      | 32    | src/etherscan/mainnet_0xe42f02713aec989132c1755117f768dbea523d2f/StakedTokenV2Rev3/Contract.sol:StakedTokenV2Rev3 |
| \_\_\_\_\_\_gap                   | uint256[50]                                                                            | 10   | 0      | 1600  | src/etherscan/mainnet_0xe42f02713aec989132c1755117f768dbea523d2f/StakedTokenV2Rev3/Contract.sol:StakedTokenV2Rev3 |
| assets                            | mapping(address => struct AaveDistributionManager.AssetData)                           | 60   | 0      | 32    | src/etherscan/mainnet_0xe42f02713aec989132c1755117f768dbea523d2f/StakedTokenV2Rev3/Contract.sol:StakedTokenV2Rev3 |
| stakerRewardsToClaim              | mapping(address => uint256)                                                            | 61   | 0      | 32    | src/etherscan/mainnet_0xe42f02713aec989132c1755117f768dbea523d2f/StakedTokenV2Rev3/Contract.sol:StakedTokenV2Rev3 |
| stakersCooldowns                  | mapping(address => uint256)                                                            | 62   | 0      | 32    | src/etherscan/mainnet_0xe42f02713aec989132c1755117f768dbea523d2f/StakedTokenV2Rev3/Contract.sol:StakedTokenV2Rev3 |
| \_votingDelegates                 | mapping(address => address)                                                            | 63   | 0      | 32    | src/etherscan/mainnet_0xe42f02713aec989132c1755117f768dbea523d2f/StakedTokenV2Rev3/Contract.sol:StakedTokenV2Rev3 |
| \_propositionPowerSnapshots       | mapping(address => mapping(uint256 => struct GovernancePowerDelegationERC20.Snapshot)) | 64   | 0      | 32    | src/etherscan/mainnet_0xe42f02713aec989132c1755117f768dbea523d2f/StakedTokenV2Rev3/Contract.sol:StakedTokenV2Rev3 |
| \_propositionPowerSnapshotsCounts | mapping(address => uint256)                                                            | 65   | 0      | 32    | src/etherscan/mainnet_0xe42f02713aec989132c1755117f768dbea523d2f/StakedTokenV2Rev3/Contract.sol:StakedTokenV2Rev3 |
| \_propositionPowerDelegates       | mapping(address => address)                                                            | 66   | 0      | 32    | src/etherscan/mainnet_0xe42f02713aec989132c1755117f768dbea523d2f/StakedTokenV2Rev3/Contract.sol:StakedTokenV2Rev3 |
| DOMAIN_SEPARATOR                  | bytes32                                                                                | 67   | 0      | 32    | src/etherscan/mainnet_0xe42f02713aec989132c1755117f768dbea523d2f/StakedTokenV2Rev3/Contract.sol:StakedTokenV2Rev3 |
| \_nonces                          | mapping(address => uint256)                                                            | 68   | 0      | 32    | src/etherscan/mainnet_0xe42f02713aec989132c1755117f768dbea523d2f/StakedTokenV2Rev3/Contract.sol:StakedTokenV2Rev3 |

### stkAAVE After

| Name                              | Type                                                                                   | Slot | Offset | Bytes | Contract                                    |
| --------------------------------- | -------------------------------------------------------------------------------------- | ---- | ------ | ----- | ------------------------------------------- |
| \_balances                        | mapping(address => uint256)                                                            | 0    | 0      | 32    | src/contracts/StakedAaveV3.sol:StakedAaveV3 |
| \_allowances                      | mapping(address => mapping(address => uint256))                                        | 1    | 0      | 32    | src/contracts/StakedAaveV3.sol:StakedAaveV3 |
| \_totalSupply                     | uint256                                                                                | 2    | 0      | 32    | src/contracts/StakedAaveV3.sol:StakedAaveV3 |
| \_name                            | string                                                                                 | 3    | 0      | 32    | src/contracts/StakedAaveV3.sol:StakedAaveV3 |
| \_symbol                          | string                                                                                 | 4    | 0      | 32    | src/contracts/StakedAaveV3.sol:StakedAaveV3 |
| \_decimals                        | uint8                                                                                  | 5    | 0      | 1     | src/contracts/StakedAaveV3.sol:StakedAaveV3 |
| \_votingSnapshots                 | mapping(address => mapping(uint256 => struct GovernancePowerDelegationERC20.Snapshot)) | 6    | 0      | 32    | src/contracts/StakedAaveV3.sol:StakedAaveV3 |
| \_votingSnapshotsCounts           | mapping(address => uint256)                                                            | 7    | 0      | 32    | src/contracts/StakedAaveV3.sol:StakedAaveV3 |
| \_aaveGovernance                  | contract ITransferHook                                                                 | 8    | 0      | 20    | src/contracts/StakedAaveV3.sol:StakedAaveV3 |
| lastInitializedRevision           | uint256                                                                                | 9    | 0      | 32    | src/contracts/StakedAaveV3.sol:StakedAaveV3 |
| \_\_\_\_\_\_gap                   | uint256[50]                                                                            | 10   | 0      | 1600  | src/contracts/StakedAaveV3.sol:StakedAaveV3 |
| assets                            | mapping(address => struct AaveDistributionManager.AssetData)                           | 60   | 0      | 32    | src/contracts/StakedAaveV3.sol:StakedAaveV3 |
| stakerRewardsToClaim              | mapping(address => uint256)                                                            | 61   | 0      | 32    | src/contracts/StakedAaveV3.sol:StakedAaveV3 |
| stakersCooldowns                  | mapping(address => uint256)                                                            | 62   | 0      | 32    | src/contracts/StakedAaveV3.sol:StakedAaveV3 |
| \_votingDelegates                 | mapping(address => address)                                                            | 63   | 0      | 32    | src/contracts/StakedAaveV3.sol:StakedAaveV3 |
| \_propositionPowerSnapshots       | mapping(address => mapping(uint256 => struct GovernancePowerDelegationERC20.Snapshot)) | 64   | 0      | 32    | src/contracts/StakedAaveV3.sol:StakedAaveV3 |
| \_propositionPowerSnapshotsCounts | mapping(address => uint256)                                                            | 65   | 0      | 32    | src/contracts/StakedAaveV3.sol:StakedAaveV3 |
| \_propositionPowerDelegates       | mapping(address => address)                                                            | 66   | 0      | 32    | src/contracts/StakedAaveV3.sol:StakedAaveV3 |
| DOMAIN_SEPARATOR                  | bytes32                                                                                | 67   | 0      | 32    | src/contracts/StakedAaveV3.sol:StakedAaveV3 |
| \_nonces                          | mapping(address => uint256)                                                            | 68   | 0      | 32    | src/contracts/StakedAaveV3.sol:StakedAaveV3 |
| \_admins                          | mapping(uint256 => address)                                                            | 69   | 0      | 32    | src/contracts/StakedAaveV3.sol:StakedAaveV3 |
| \_pendingAdmins                   | mapping(uint256 => address)                                                            | 70   | 0      | 32    | src/contracts/StakedAaveV3.sol:StakedAaveV3 |
| \_cooldownSeconds                 | uint256                                                                                | 71   | 0      | 32    | src/contracts/StakedAaveV3.sol:StakedAaveV3 |
| \_maxSlashablePercentage          | uint256                                                                                | 72   | 0      | 32    | src/contracts/StakedAaveV3.sol:StakedAaveV3 |
| \_exchangeRateSnapshots           | mapping(uint256 => struct GovernancePowerDelegationERC20.Snapshot)                     | 73   | 0      | 32    | src/contracts/StakedAaveV3.sol:StakedAaveV3 |
| \_exchangeRateSnapshotsCount      | uint120                                                                                | 74   | 0      | 15    | src/contracts/StakedAaveV3.sol:StakedAaveV3 |
| \_currentExchangeRate             | uint128                                                                                | 74   | 15     | 16    | src/contracts/StakedAaveV3.sol:StakedAaveV3 |
| inPostSlashingPeriod              | bool                                                                                   | 74   | 31     | 1     | src/contracts/StakedAaveV3.sol:StakedAaveV3 |

### stkABPT Before

| Name                              | Type                                                                                   | Slot | Offset | Bytes | Contract                                                                                                            |
| --------------------------------- | -------------------------------------------------------------------------------------- | ---- | ------ | ----- | ------------------------------------------------------------------------------------------------------------------- |
| \_balances                        | mapping(address => uint256)                                                            | 0    | 0      | 32    | src/etherscan/mainnet_0x7183143a9e223a12a83d1e28c98f7d01a68993e8/StakedTokenBptRev2/Contract.sol:StakedTokenBptRev2 |
| \_allowances                      | mapping(address => mapping(address => uint256))                                        | 1    | 0      | 32    | src/etherscan/mainnet_0x7183143a9e223a12a83d1e28c98f7d01a68993e8/StakedTokenBptRev2/Contract.sol:StakedTokenBptRev2 |
| \_totalSupply                     | uint256                                                                                | 2    | 0      | 32    | src/etherscan/mainnet_0x7183143a9e223a12a83d1e28c98f7d01a68993e8/StakedTokenBptRev2/Contract.sol:StakedTokenBptRev2 |
| \_name                            | string                                                                                 | 3    | 0      | 32    | src/etherscan/mainnet_0x7183143a9e223a12a83d1e28c98f7d01a68993e8/StakedTokenBptRev2/Contract.sol:StakedTokenBptRev2 |
| \_symbol                          | string                                                                                 | 4    | 0      | 32    | src/etherscan/mainnet_0x7183143a9e223a12a83d1e28c98f7d01a68993e8/StakedTokenBptRev2/Contract.sol:StakedTokenBptRev2 |
| \_decimals                        | uint8                                                                                  | 5    | 0      | 1     | src/etherscan/mainnet_0x7183143a9e223a12a83d1e28c98f7d01a68993e8/StakedTokenBptRev2/Contract.sol:StakedTokenBptRev2 |
| \_votingSnapshots                 | mapping(address => mapping(uint256 => struct GovernancePowerDelegationERC20.Snapshot)) | 6    | 0      | 32    | src/etherscan/mainnet_0x7183143a9e223a12a83d1e28c98f7d01a68993e8/StakedTokenBptRev2/Contract.sol:StakedTokenBptRev2 |
| \_votingSnapshotsCounts           | mapping(address => uint256)                                                            | 7    | 0      | 32    | src/etherscan/mainnet_0x7183143a9e223a12a83d1e28c98f7d01a68993e8/StakedTokenBptRev2/Contract.sol:StakedTokenBptRev2 |
| \_aaveGovernance                  | contract ITransferHook                                                                 | 8    | 0      | 20    | src/etherscan/mainnet_0x7183143a9e223a12a83d1e28c98f7d01a68993e8/StakedTokenBptRev2/Contract.sol:StakedTokenBptRev2 |
| lastInitializedRevision           | uint256                                                                                | 9    | 0      | 32    | src/etherscan/mainnet_0x7183143a9e223a12a83d1e28c98f7d01a68993e8/StakedTokenBptRev2/Contract.sol:StakedTokenBptRev2 |
| \_\_\_\_\_\_gap                   | uint256[50]                                                                            | 10   | 0      | 1600  | src/etherscan/mainnet_0x7183143a9e223a12a83d1e28c98f7d01a68993e8/StakedTokenBptRev2/Contract.sol:StakedTokenBptRev2 |
| assets                            | mapping(address => struct AaveDistributionManager.AssetData)                           | 60   | 0      | 32    | src/etherscan/mainnet_0x7183143a9e223a12a83d1e28c98f7d01a68993e8/StakedTokenBptRev2/Contract.sol:StakedTokenBptRev2 |
| stakerRewardsToClaim              | mapping(address => uint256)                                                            | 61   | 0      | 32    | src/etherscan/mainnet_0x7183143a9e223a12a83d1e28c98f7d01a68993e8/StakedTokenBptRev2/Contract.sol:StakedTokenBptRev2 |
| stakersCooldowns                  | mapping(address => uint256)                                                            | 62   | 0      | 32    | src/etherscan/mainnet_0x7183143a9e223a12a83d1e28c98f7d01a68993e8/StakedTokenBptRev2/Contract.sol:StakedTokenBptRev2 |
| \_votingDelegates                 | mapping(address => address)                                                            | 63   | 0      | 32    | src/etherscan/mainnet_0x7183143a9e223a12a83d1e28c98f7d01a68993e8/StakedTokenBptRev2/Contract.sol:StakedTokenBptRev2 |
| \_propositionPowerSnapshots       | mapping(address => mapping(uint256 => struct GovernancePowerDelegationERC20.Snapshot)) | 64   | 0      | 32    | src/etherscan/mainnet_0x7183143a9e223a12a83d1e28c98f7d01a68993e8/StakedTokenBptRev2/Contract.sol:StakedTokenBptRev2 |
| \_propositionPowerSnapshotsCounts | mapping(address => uint256)                                                            | 65   | 0      | 32    | src/etherscan/mainnet_0x7183143a9e223a12a83d1e28c98f7d01a68993e8/StakedTokenBptRev2/Contract.sol:StakedTokenBptRev2 |
| \_propositionPowerDelegates       | mapping(address => address)                                                            | 66   | 0      | 32    | src/etherscan/mainnet_0x7183143a9e223a12a83d1e28c98f7d01a68993e8/StakedTokenBptRev2/Contract.sol:StakedTokenBptRev2 |
| DOMAIN_SEPARATOR                  | bytes32                                                                                | 67   | 0      | 32    | src/etherscan/mainnet_0x7183143a9e223a12a83d1e28c98f7d01a68993e8/StakedTokenBptRev2/Contract.sol:StakedTokenBptRev2 |
| \_nonces                          | mapping(address => uint256)                                                            | 68   | 0      | 32    | src/etherscan/mainnet_0x7183143a9e223a12a83d1e28c98f7d01a68993e8/StakedTokenBptRev2/Contract.sol:StakedTokenBptRev2 |

### StkABPT After

| Name                              | Type                                                                                   | Slot | Offset | Bytes | Contract                                      |
| --------------------------------- | -------------------------------------------------------------------------------------- | ---- | ------ | ----- | --------------------------------------------- |
| \_balances                        | mapping(address => uint256)                                                            | 0    | 0      | 32    | src/contracts/StakedTokenV3.sol:StakedTokenV3 |
| \_allowances                      | mapping(address => mapping(address => uint256))                                        | 1    | 0      | 32    | src/contracts/StakedTokenV3.sol:StakedTokenV3 |
| \_totalSupply                     | uint256                                                                                | 2    | 0      | 32    | src/contracts/StakedTokenV3.sol:StakedTokenV3 |
| \_name                            | string                                                                                 | 3    | 0      | 32    | src/contracts/StakedTokenV3.sol:StakedTokenV3 |
| \_symbol                          | string                                                                                 | 4    | 0      | 32    | src/contracts/StakedTokenV3.sol:StakedTokenV3 |
| \_decimals                        | uint8                                                                                  | 5    | 0      | 1     | src/contracts/StakedTokenV3.sol:StakedTokenV3 |
| \_votingSnapshots                 | mapping(address => mapping(uint256 => struct GovernancePowerDelegationERC20.Snapshot)) | 6    | 0      | 32    | src/contracts/StakedTokenV3.sol:StakedTokenV3 |
| \_votingSnapshotsCounts           | mapping(address => uint256)                                                            | 7    | 0      | 32    | src/contracts/StakedTokenV3.sol:StakedTokenV3 |
| \_aaveGovernance                  | contract ITransferHook                                                                 | 8    | 0      | 20    | src/contracts/StakedTokenV3.sol:StakedTokenV3 |
| lastInitializedRevision           | uint256                                                                                | 9    | 0      | 32    | src/contracts/StakedTokenV3.sol:StakedTokenV3 |
| \_\_\_\_\_\_gap                   | uint256[50]                                                                            | 10   | 0      | 1600  | src/contracts/StakedTokenV3.sol:StakedTokenV3 |
| assets                            | mapping(address => struct AaveDistributionManager.AssetData)                           | 60   | 0      | 32    | src/contracts/StakedTokenV3.sol:StakedTokenV3 |
| stakerRewardsToClaim              | mapping(address => uint256)                                                            | 61   | 0      | 32    | src/contracts/StakedTokenV3.sol:StakedTokenV3 |
| stakersCooldowns                  | mapping(address => uint256)                                                            | 62   | 0      | 32    | src/contracts/StakedTokenV3.sol:StakedTokenV3 |
| \_votingDelegates                 | mapping(address => address)                                                            | 63   | 0      | 32    | src/contracts/StakedTokenV3.sol:StakedTokenV3 |
| \_propositionPowerSnapshots       | mapping(address => mapping(uint256 => struct GovernancePowerDelegationERC20.Snapshot)) | 64   | 0      | 32    | src/contracts/StakedTokenV3.sol:StakedTokenV3 |
| \_propositionPowerSnapshotsCounts | mapping(address => uint256)                                                            | 65   | 0      | 32    | src/contracts/StakedTokenV3.sol:StakedTokenV3 |
| \_propositionPowerDelegates       | mapping(address => address)                                                            | 66   | 0      | 32    | src/contracts/StakedTokenV3.sol:StakedTokenV3 |
| DOMAIN_SEPARATOR                  | bytes32                                                                                | 67   | 0      | 32    | src/contracts/StakedTokenV3.sol:StakedTokenV3 |
| \_nonces                          | mapping(address => uint256)                                                            | 68   | 0      | 32    | src/contracts/StakedTokenV3.sol:StakedTokenV3 |
| \_admins                          | mapping(uint256 => address)                                                            | 69   | 0      | 32    | src/contracts/StakedTokenV3.sol:StakedTokenV3 |
| \_pendingAdmins                   | mapping(uint256 => address)                                                            | 70   | 0      | 32    | src/contracts/StakedTokenV3.sol:StakedTokenV3 |
| \_cooldownSeconds                 | uint256                                                                                | 71   | 0      | 32    | src/contracts/StakedTokenV3.sol:StakedTokenV3 |
| \_maxSlashablePercentage          | uint256                                                                                | 72   | 0      | 32    | src/contracts/StakedTokenV3.sol:StakedTokenV3 |
| \_exchangeRateSnapshots           | mapping(uint256 => struct GovernancePowerDelegationERC20.Snapshot)                     | 73   | 0      | 32    | src/contracts/StakedTokenV3.sol:StakedTokenV3 |
| \_exchangeRateSnapshotsCount      | uint120                                                                                | 74   | 0      | 15    | src/contracts/StakedTokenV3.sol:StakedTokenV3 |
| \_currentExchangeRate             | uint128                                                                                | 74   | 15     | 16    | src/contracts/StakedTokenV3.sol:StakedTokenV3 |
| inPostSlashingPeriod              | bool                                                                                   | 74   | 31     | 1     | src/contracts/StakedTokenV3.sol:StakedTokenV3 |

## Development

### Install

```sh
cp .env.example .env
forge install
```

### Test

```sh
forge test
```

### Diff

Generate a code & storage layout diff.

```sh
npm run diff
```
