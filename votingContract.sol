pragma solidity 0.6.12;

contract Ballot {
    struct Voters {
        bool voted;
        uint vote;
        uint weight;
    }
    struct Proposal {
    bytes32 name; //name of each proposal
    uint voteCount; // Number of accumulated Votes
}
}
