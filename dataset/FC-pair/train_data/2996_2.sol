contract c2996{
//==============================================================================
//     _    |_ |. _   |`    _  __|_. _  _  _  .
//    |_)|_||_)||(_  ~|~|_|| |(_ | |(_)| |_\  .  (use these to interact with contract)
//====|=========================================================================    
    /**
     * @dev registers a name.  UI will always display the last name you registered.
     * but you will still own all previously registered names to use as affiliate 
     * links.
     * - must pay a registration fee.
     * - name must be unique
     * - names will be converted to lowercase
     * - name cannot start or end with a space 
     * - cannot have more than 1 space in a row
     * - cannot be only numbers
     * - cannot start with 0x 
     * - name must be at least 1 char
     * - max length of 32 characters long
     * - allowed characters: a-z, 0-9, and space
     * -functionhash- 0x921dec21 (using ID for affiliate)
     * -functionhash- 0x3ddd4698 (using address for affiliate)
     * -functionhash- 0x685ffd83 (using name for affiliate)
     * @param _nameString players desired name
     * @param _affCode affiliate ID, address, or name of who refered you
     * @param _all set to true if you want this to push your info to all games 
     * (this might cost a lot of gas)
     */
    function registerNameXID(string _nameString, uint256 _affCode, bool _all)
        isHuman()
        public
        payable 
    {
        // make sure name fees paid
        require (msg.value >= registrationFee_, "umm.....  you have to pay the name fee");
        // filter name + condition checks
        bytes32 _name = NameFilter.nameFilter(_nameString);
        // set up address 
        address _addr = msg.sender;
        // set up our tx event data and determine if player is new or not
        bool _isNewPlayer = determinePID(_addr);
        // fetch player id
        uint256 _pID = pIDxAddr_[_addr];
        // manage affiliate residuals
        // if no affiliate code was given, no new affiliate code was given, or the 
        // player tried to use their own pID as an affiliate code, lolz
        if (_affCode != 0 && _affCode != plyr_[_pID].laff && _affCode != _pID) 
        {
            // update last affiliate 
            plyr_[_pID].laff = _affCode;
        } else if (_affCode == _pID) {
            _affCode = 0;
        }
        // register name 
        registerNameCore(_pID, _addr, _affCode, _name, _isNewPlayer, _all);
    }
}