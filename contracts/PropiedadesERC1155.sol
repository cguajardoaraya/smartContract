// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// Contrato ERC-1155 para representar fracciones de propiedades
contract PropiedadesERC1155 is ERC1155, Ownable {
    constructor(string memory uri) ERC1155(uri) Ownable(msg.sender)  {}

    // Función para crear nuevas fracciones de una propiedad tokenizada
    function mint(address account, uint256 id, uint256 amount, bytes memory data) public onlyOwner {
        _mint(account, id, amount, data);
    }

    // Función para quemar fracciones de una propiedad tokenizada
    function burn(address account, uint256 id, uint256 amount) public onlyOwner {
        _burn(account, id, amount);
    }

    // Función para establecer la URI base
    function setURI(string memory newuri) external onlyOwner {
        _setURI(newuri);
    }
}
