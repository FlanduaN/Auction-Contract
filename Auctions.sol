// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract Auctions {
    uint256 public auctionId;

    struct Bid {
        address bidder;
        uint256 value;
        uint256 createdAt;
    }

    struct Auction {
        uint256 startTime;
        uint256 endTime;
        uint256 tokenId;
        Bid[] bids
    }

    mapping (uint256 => Auction) private auctions;

    function createAuction(uint256 tokenId, uint256 endTime) public returns (uint256 auctionId) {

    }

    function bid() public payable returns (bool) {

    }

    function endAuction() public returns(bool) {
        
    }

}