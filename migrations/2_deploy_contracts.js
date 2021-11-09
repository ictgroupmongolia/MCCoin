require('@openzeppelin/test-helpers/configure')({ provider: web3.currentProvider, environment: 'truffle' })
const { singletons, BN } = require('@openzeppelin/test-helpers')

const TestToken = artifacts.require("TestToken")


module.exports = async function (deployer, network, accounts) {
  console.log(`network name: ${network}`)
  if (network === 'development') {
    // In a test environment an ERC777 token requires deploying an ERC1820 registry
    await singletons.ERC1820Registry(accounts[0])
  }
  await deployer.deploy(TestToken)
}