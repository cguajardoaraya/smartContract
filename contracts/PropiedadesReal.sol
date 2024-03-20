// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./PropiedadesERC721.sol";
import "./PropiedadesERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// Contrato que interactúa con los dos contratos anteriores
contract PropiedadTokenization is Ownable {
    PropiedadesERC721 public erc721Contract;
    PropiedadesERC1155 public erc1155Contract;

    constructor() Ownable(msg.sender) {
        erc721Contract = new PropiedadesERC721();
        erc1155Contract = new  PropiedadesERC1155("");
    }

    // Función para crear un nuevo token ERC-721 que representa una propiedad
    function mintERC721(address to, uint256 tokenId) public onlyOwner {
        erc721Contract.mint(to, tokenId);
    }

    // Función para crear nuevas fracciones de una propiedad tokenizada
    function mintERC1155(address to, uint256 id, uint256 amount, bytes memory data) public onlyOwner {
        erc1155Contract.mint(to, id, amount, data);
    }

    // Función para quemar un token ERC-721 que representa una propiedad
    function burnERC721(uint256 tokenId) public onlyOwner {
        erc721Contract.burn(tokenId);
    }

    // Función para quemar fracciones de una propiedad tokenizada
    function burnERC1155(address account, uint256 id, uint256 amount) public onlyOwner {
        erc1155Contract.burn(account, id, amount);
    }

    // Función para establecer la URI base del contrato ERC-1155
    function setERC1155URI(string memory newuri) public onlyOwner {
        erc1155Contract.setURI(newuri);
    }
}
