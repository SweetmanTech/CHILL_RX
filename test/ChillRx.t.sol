// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "forge-std/Test.sol";
import "../src/ChillRx.sol";

contract ChillRxTest is Test {
    ChillRx nft;

    function setUp() public {
        nft = new ChillRx();
    }

    function testCan_initStateVariables() public {
        assertEq(nft.name(), "CHILLRX");
        assertEq(nft.symbol(), "CHILLRX");
    }

    function testCan_mint() public {
        nft.mint(address(this), 1);
        assertEq(nft.ownerOf(1), address(this));
    }

    function testCan_revertMintExistingToken() public {
        nft.mint(address(this), 1);
        assertEq(nft.ownerOf(1), address(this));
        vm.expectRevert("ERC721: token already minted");
        nft.mint(address(1), 1);
        assertEq(nft.ownerOf(1), address(this));
    }

    function testCan_batchMint() public {
        uint256[] memory tokenIds = new uint256[](3);
        tokenIds[0] = 69;
        tokenIds[1] = 1;
        tokenIds[2] = 420;
        nft.batchMint(address(1), tokenIds);
        assertEq(nft.ownerOf(1), address(1));
        assertEq(nft.ownerOf(69), address(1));
        assertEq(nft.ownerOf(420), address(1));
    }
}
