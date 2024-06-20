// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import 'forge-std/Script.sol';
import {StakedRexV3} from '../src/contracts/StakedRexV3.sol';
import {IERC20} from '../src/interfaces/IERC20.sol';
import {TransparentUpgradeableProxy} from 'solidity-utils/contracts/transparent-proxy/TransparentUpgradeableProxy.sol';
import {ProxyAdmin} from 'solidity-utils/contracts/transparent-proxy/ProxyAdmin.sol';

contract DeployStakedREXV3 is Script {
  address public constant SLASHING_ADMIN = address(1);

  address public constant COOLDOWN_ADMIN = address(2);

  address public constant CLAIM_HELPER = address(3);

  address public constant REWARDS_VAULT = address(4);

  address public constant EMISSION_MANAGER = address(5);

  uint256 public constant MAX_SLASHING = 3000; // 30%

  uint256 public constant COOLDOWN_SECONDS = 1728000; // 20 days

  uint256 public constant UNSTAKE_WINDOW = 172800; // 2 days

  uint128 public constant DISTRIBUTION_DURATION = 3155692600; // 100 years

  address public constant ROLLEX = 0x48023b16c3e81AA7F6eFFbdEB35Bb83f4f31a8fd;

  function run() external {
    uint256 deployerPrivateKey = vm.envUint('PRIVATE_KEY');
    vm.startBroadcast(deployerPrivateKey);

    // Deploy the implementation contract
    StakedRexV3 stakedRexImpl = new StakedRexV3(
      IERC20(ROLLEX),
      IERC20(ROLLEX),
      UNSTAKE_WINDOW,
      REWARDS_VAULT,
      EMISSION_MANAGER,
      DISTRIBUTION_DURATION
    );

    // Deploy the ProxyAdmin
    ProxyAdmin proxyAdmin = new ProxyAdmin();

    // Deploy the TransparentUpgradeableProxy
    TransparentUpgradeableProxy proxy = new TransparentUpgradeableProxy(
      address(stakedRexImpl),
      address(proxyAdmin),
      abi.encodeWithSignature(
        'initialize(address,address,address,uint256,uint256)',
        SLASHING_ADMIN,
        COOLDOWN_ADMIN,
        CLAIM_HELPER,
        MAX_SLASHING,
        COOLDOWN_SECONDS
      )
    );

    console.log(
      'StakedAave implementation deployed at:',
      address(stakedRexImpl)
    );
    console.log('Proxy deployed at:', address(proxy));
    console.log('Proxy Admin deployed at:', address(proxyAdmin));

    vm.stopBroadcast();
  }
}
