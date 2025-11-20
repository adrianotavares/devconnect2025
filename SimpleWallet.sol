// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
/*
* SimpleWallet
* -------------
* Este contrato funciona como uma carteira (wallet) bem simples.
* Ele guarda ETH enviado e permite que apenas o dono
* (quem implantou o contrato) faça saques.
*/
contract SimpleWallet {

    // Armazena o endereço do dono da carteira (quem implantou o contrato)
    address public owner;

    // Armazena o saldo da carteira
    uint256 public balance;
    
    // Eventos são como "logs" que registram ações no blockchain
    event Deposited(address indexed from, uint256 amount);
    event Withdrawn(address indexed to, uint256 amount);

    /*
    * A função construtor roda apenas uma vez, no momento do deploy.
    * Aqui definimos o dono como a pessoa que implantou o contrato.
    */
    constructor() {
        owner = msg.sender; // msg.sender = endereço que criou o contrato
    }
    
    /*
    * Função de depósito.
    * Qualquer pessoa pode enviar ETH para este contrato usando esta função.
    * O valor enviado fica guardado no saldo interno da carteira.
    */
    receive() external payable {
        require(msg.value > 0, "Precisa enviar algum ETH");
        balance += msg.value; // soma o valor enviado ao saldo
        emit Deposited(msg.sender, msg.value); // registra ocevento no log
    }

    /*
    * Função de saque.
    * Apenas o dono pode retirar fundos da carteira.
    * O valor solicitado é transferido para a conta do dono.
    */
    function withdraw(uint256 amount) external {
        require(msg.sender == owner, "Apenas o dono pode sacar");
        require(amount <= balance, "Saldo insuficiente");
        balance -= amount; // reduz o saldo interno
        payable(owner).transfer(amount); // envia ETH para o dono
        emit Withdrawn(owner, amount); // registra no log
    }

    /*
    * Função de leitura.
    * Qualquer pessoa pode consultar o saldo da carteira.
    */
    function getBalance() external view returns (uint256) {
        return balance;
    }
}