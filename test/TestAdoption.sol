//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.5.0;

//Import the necessary dependencies
import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
    //Address of the Adoption contract to be tested
    Adoption adoption = Adoption(DeployedAddresses.Adoption());
    
    //The ID of the pet that will be used for teting
    uint expectedPetId = 13;

    //The expected owner of the adopted pet is this contract
    address expectedAdopter = address(this);


    //Testing the adopt() function
    function testUserCanAdoptPet() public {
        uint returnedPetId = adoption.adopt(expectedPetId);
        Assert.equal(returnedPetId, expectedPetId, "The Adoption should return the expected pet ID");
    }

    //Testing the retrieval of a single pet Adopter
    function testGetAdopterAddressByPetId() public {
        address returnedAdopterAddress = adoption.adopters(expectedPetId);
        Assert.equal(returnedAdopterAddress, expectedAdopter, "The getter function should return the expected Adopter's Address");

    }

    //Testing Retrieval of all Pet Adopters
    function testGetAdopterAddressByPetIdInArray() public {
        //Store the adopters in memory rather than contract storage
        address[16] memory adopters = adoption.getAdopters();
        Assert.equal(adopters[expectedPetId], expectedAdopter, "The array getter function should return all the pet Adopters  " );
    }



    
}