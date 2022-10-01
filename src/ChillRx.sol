// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "openzeppelin-contracts/token/ERC721/ERC721.sol";

contract ChillRx is ERC721 {
    constructor() ERC721("CHILLRX", "CHILLRX") {}

    /// @notice mint a token to an addres
    function mint(address _to, uint256 _tokenId) public {
        _mint(_to, _tokenId);
    }

    /// @notice mints a batch of tokens to an addres
    function batchMint(address _to, uint256[] calldata _tokenIds) public {
        for (uint256 i; i < _tokenIds.length; ) {
            _mint(_to, _tokenIds[i]);

            unchecked {
                ++i;
            }
        }
    }
}
