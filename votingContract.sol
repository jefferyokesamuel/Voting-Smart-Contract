pragma solidity 0.6.12;

contract Ballot {
    struct Voter {
        bool voted;
        uint vote;
        uint weight;
    }

    struct Proposal {
    bytes32 name; //name of each proposal
    uint voteCount; // Number of accumulated Votes
    }

    Proposal[] proposals;

    mapping(address => Voters) voters; //voters get address as a key and Voter for a value 
    
    address public chairperson

    constructor (bytes32[] memory proposalNames) {

        chairperson = msg.sender;

        voters[chairperson].weight = 1;

        for (uint i=0; i < proposalNames.length; i++) {
            proposals.push(Proposal({
                name: proposalNames[i],
                voteCount: 0
            }));
        }
    }

    //Function to atuenticate Voter
    function allowVote(address voter) public {
        require( msg.sender == chairperson, "Only the chairperson has access");
        require(!voters[voter].voted, "This Voter has already voted"); 
        require(voters[voter].weight == 0 );

        voters[voter].weight = 1
    }

    
}
