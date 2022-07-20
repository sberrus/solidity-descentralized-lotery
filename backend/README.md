# Loteria descentralizada

En esta sección vamos a crear una loteria descentralizada la cual mediante la compra de un "ticket" registras tu Public key de manera que esta pueda ser cogida aletoriaente entre todos las public keys de los participantes.

Que permitira hacer este contrato:

-   Entrar en la loteria (pagando una entrada)
-   El contrato será capaz de seleccionar un ganador aleatorio (Mediante Oracle Chainlink Randomness)
-   El contrato escogerá un ganador cada X cantidad de tiempo -> Completamente aútomatico (Usando Oracle Chainlink Automated Execution) \*\* Aunque veremos como hacer un picker que podamos decidir cuando se escoge al ganador.
