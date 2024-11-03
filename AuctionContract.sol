// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract Auctions {
    uint256 public startinglValue;
    uint256 public startDate;
    uint256 public durationTime;
    uint256 private bestOffer;
    address private winnerBidder;
    uint8 checkpiont;
    address public owner;
    mapping (address => uint256) public bidEntered;

    constructor() {
        owner = msg.sender;
        startinglValue = 1 gwei;
        startDate = block.timestamp;
        durationTime = startDate + 7 days;
    }

    function getWinnwrBidder() external view returns(address) {
        return winnerBidder;
    }

    function getBid () external view returns(uint256) {
        return bestOffer;
    }

    function setBid() external payable {
        require(checkpiont == 0, "The auction ended.");
        uint256 _offeredValue = msg.value;
        require(_offeredValue > bestOffer, "Your offer is lower than the best value.");

        if(_offeredValue > bestOffer) {
            address _addrBidder = msg.sender;
            bestOffer = _offeredValue;
            winnerBidder = _addrBidder;
            bidEntered [_addrBidder] += _offeredValue;
        }
        else {
            revert ("You didn't beat the best offer.");
        }
    }

    function endAuction() external payable {
        require(owner==msg.sender, "You don't have permissions.");
        checkpiont = 1;
    }

}