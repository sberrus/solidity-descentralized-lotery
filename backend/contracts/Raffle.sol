// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Ver README.md para saber que deberá hacer este contrato.

error Raffle__NotEnoughtETHEntered();

contract Raffle {
    uint256 private immutable i_entranceFee;
    // Agregando payable para indicar que son adress payables.
    address payable[] private s_players;

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    /**
        Mediante esta función podremos ingresar y formar parte de la loteria.
     */
    function enterRaffle() public payable {
        if (msg.value < i_entranceFee) {
            revert Raffle__NotEnoughtETHEntered();
        }
    }

    function pickRandomeWinner() public {}

    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }
}
