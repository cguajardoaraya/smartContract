// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// Contrato ERC-721 para representar propiedades individuales
contract PropiedadesERC721 is ERC721, Ownable {
    constructor() ERC721("Prop", "PP") Ownable(msg.sender) {}

    // Función para crear un nuevo token ERC-721 que representa una propiedad
    function mint(address to, uint256 tokenId) public onlyOwner {
        _mint(to, tokenId);
    }

    // Función para quemar un token ERC-721 que representa una propiedad
    function burn(uint256 tokenId) public  onlyOwner {
        _burn(tokenId);
    }
}
