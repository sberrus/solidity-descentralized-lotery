// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Ver README.md para saber que deberá hacer este contrato.

error Raffle__NotEnoughtETHEntered();

contract Raffle {
    /** State Variables */
    uint256 private immutable i_entranceFee;
    // Agregando payable para indicar que son adress payables.
    address payable[] private s_players;

    /** Events */
    event RaffleEnter(address indexed player);

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
        /**
            Si el jugador pago suficiente eth para participar, casteamos el address para que sea payable y lo agregamos
            al array de array de payable addresses
        */
        s_players.push(payable(msg.sender));

        // INTRODUCCION A LOS EVENTOS
        /**
            Los eventos son un método de comunicación que nos ofrecen los smartcontracts en el cual consiste en enviar mesajes 
            en ciertos momentos de la ejecución de nuestro código el cual suele ser usado para que los frontend developers puedan
            crear interacciones con dichos eventos. 

            Los eventos emitidos los podemos ver mediante los logs del contrato. Estos logs los podemos pedir al RPC mediante 
            en método "eth_getLogs" o en etherscan podemos observar dichos logs en la información del contrato. 

            Los eventos se suelen declarar al inicio del contrato luego de las variables de estado mediante la kw "event [NOMBRE_EVENTO]" 
            y se consume mediante la kw "emit [NOMBRE_EVENTO]" en el fragmento de código donde queremos que dicho evento se ejecute.

            La kw indexed en los argumentos de la función, ayuda que esa información del evento quede indexada y sea más
            fácil acceder a dicha información cuando querramos buscarla. Solo se pueden tener 3 indexed
         */

        emit RaffleEnter(msg.sender);
    }

    function pickRandomWinner() public {}

    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }

    function getPlayer(uint256 index) public view returns (address) {
        return s_players[index];
    }
}
