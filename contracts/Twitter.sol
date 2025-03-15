// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Twitter {

    uint MAX_LENGTH;
    address public owner;

    constructor() {
        owner=msg.sender;
        MAX_LENGTH=280;
    }

    struct Tweet{
        uint id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }
    mapping (address => Tweet[] ) Tweets;

    modifier onlyOwner() {
        require(msg.sender == owner,"You Are Not the Owner!");
        _;
    }

    function changeTweetLength(uint length) public onlyOwner {
        MAX_LENGTH =length;
    }

    function postTweet(string memory tweet) public {
        require(bytes(tweet).length <= MAX_LENGTH,"Tweet is too large!" );
        Tweet memory newTweet=Tweet({
            id:Tweets[msg.sender].length,
            author:msg.sender,
            content:tweet,
            timestamp:block.timestamp,
            likes:0
        });
        Tweets[msg.sender].push(newTweet);
    }

    function Like(address author,uint id) external {
        require(Tweets[author].length > id ,"Error: Tweet doesn't exits");
        Tweets[author][id].likes++;
    }

    function unLike(address author,uint id) external  {
        require(Tweets[author].length > id ,"Error: Tweet doesn't exits");
        require(Tweets[author][id].likes > 0,"Likes are Zero!");
        Tweets[author][id].likes--;
    }

    function getTweet(uint32 i) public view returns (Tweet memory){
        return Tweets[msg.sender][i];
    }

    function getAllTweets() public view returns (Tweet[] memory){
        return Tweets[msg.sender];
    }
}