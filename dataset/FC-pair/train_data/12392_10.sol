contract c12392{
    /********************************* */
    // petition functions
    function createPetition(string _name, string _message, uint _signaturesNeeded, bool _featured, string _connectingHash) payable public {
        require(msg.value >= createPetitionFee);
        uint featuredExpires = 0;
        uint totalPaid = createPetitionFee;
        if (_featured) {
            require(msg.value >= (createPetitionFee + featurePetitionFee));
            featuredExpires = now + featuredLength;
            totalPaid = totalPaid + featurePetitionFee;
        }
        /////////////
        // cut to shareholders dividend pool:
        cutToInvestorsDividendPool(totalPaid);
        //////////
        uint id = petitions.push(Petition(_name, _message, msg.sender, _signaturesNeeded, _featured, featuredExpires, 0, now, _connectingHash, 0)) - 1;
        emit NewPetition(id, _name, _message, msg.sender, _signaturesNeeded, _featured, featuredExpires, 0, now, _connectingHash, 0);
    }
}