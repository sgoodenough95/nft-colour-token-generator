pragma solidity 0.5.16;

import "./ERC721Full.sol";

contract Color is ERC721Full {
  string[] public colors;                 // Create a new array
  mapping(string => bool) _colorExists;   // Creates k,v pair

  constructor() ERC721Full("Color", "COLOR") public {
  }

  // E.G. color = "#FFFFFF"
  function mint(string memory _color) public {    // in practice, would restrict to minter
    require(!_colorExists[_color]);         // Require unique color
    uint _id = colors.push(_color);         // Adding color
    _mint(msg.sender, _id);                 // Calling mint function passing sender address and tokenId
    _colorExists[_color] = true;            // Tracking the color
  }

}
