//const { before } = require("lodash");

//const { before } = require("lodash");
//const { describe } = require("yargs");

const Adoption = artifacts.require("Adoption");

contract("Adoption", (accounts) => {
    let adoption;
    let expectedPetId =13;

    before( async () => {
        adoption = await Adoption.deployed();
    });

    describe("Adopting a pet and retrieving account addresses", async() => {
        before("Adopt a pet using accounts[0]", async () => {
            adoption.adopt(13,{ from: accounts[0] });
            expectedAdopter = accounts[0];
        });

        it("Can fetch the address of the adopter by PetId", async () =>{
            const adopter = await adoption.adopters(expectedPetId);
            assert.equal(adopter,expectedAdopter, "The adopter of the pet specified should be the first account." );
        });

        it("Can fetch the addresses of all the adopters", async () => {
            const adopters = await adoption.getAdopters();
            assert.equal(adopters[13], expectedAdopter, "It should be able to fetch the addresses of all the adopters");
        });
        


    });




});