//below line of code will import chai assertion library. in this case we inporting expect form chai
const { expect } = require("chai");

//below line of code creates an test suite where "describe" is from "mocha" and "function" will increase the visibility for testing.
describe("1_basic_testing", function () {

  //below line creates a 1st test case set up
  it("Deployment should assign the total supply of tokens to the owner", async function () {

    //below line will set the accounts to do transactions.
    const [owner] = await ethers.getSigners(); 

    //below code wil deploy the contract named jagadeesh
    const hardhatToken = await ethers.deployContract("Jagadeesh");

    //below line creates an ownerBalance variable and it will assigned to balance of owner
    const ownerBalance = await hardhatToken.balanceOf(owner.address);

    //here is the testing is starting where we expect something form this test
    //in this case we expect that the balance of the owner is equal to the total supply of tokens
    expect(await hardhatToken.totalSupply()).to.equal(ownerBalance);
  });
});