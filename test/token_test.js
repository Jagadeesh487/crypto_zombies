const {expect} = require("chai");

describe("Thsi for testing the token smart contract", function () {
    it("chech owner tokens = balance of owner tokens", async function () {
        const [owner] = await ethers.getSigners();
        const hardhatToken = await ethers.deployContract("Token");

        const ownerbalance = await hardhatToken.balanceOf(owner.address);

        expect(await hardhatToken.totalSupply()).to.equal(ownerbalance);
    })
    it("this of transferig tokens from owner to address1 ",  async function(){
        const [owner,addr1] = await ethers.getSigners();
        const hardhatToken = await ethers.deployContract("Token");

        const sentamount = await hardhatToken.transfer(owner.address,1000);

        expect(await hardhatToken.to.equal(sentamount))
    })
})