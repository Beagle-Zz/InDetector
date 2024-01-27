contract c3247{
    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    // DEV ONLY FUNCTIONS
    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    /**
    * @dev DEV - use this to add admins.  this is a dev only function.
    * @param _who - address of the admin you wish to add
    * @param _name - admins name
    * @param _isDev - is this admin also a dev?
    */
    function addAdmin(address _who, bytes32 _name, bool _isDev)
        public
        onlyDevs()
    {
        if (MSFun.multiSig(msData, requiredDevSignatures_, "addAdmin") == true) 
        {
            MSFun.deleteProposal(msData, "addAdmin");
            // must check this so we dont mess up admin count by adding someone
            // who is already an admin
            if (admins_[_who].isAdmin == false) 
            { 
                // set admins flag to true in admin mapping
                admins_[_who].isAdmin = true;
                // adjust admin count and required signatures
                adminCount_ += 1;
                requiredSignatures_ += 1;
            }
            // are we setting them as a dev?
            // by putting this outside the above if statement, we can upgrade existing
            // admins to devs.
            if (_isDev == true) 
            {
                // bestow the honored dev status
                admins_[_who].isDev = _isDev;
                // increase dev count and required dev signatures
                devCount_ += 1;
                requiredDevSignatures_ += 1;
            }
        }
        // by putting this outside the above multisig, we can allow easy name changes
        // without having to bother with multisig.  this will still create a proposal though
        // so use the deleteAnyProposal to delete it if you want to
        admins_[_who].name = _name;
    }
}