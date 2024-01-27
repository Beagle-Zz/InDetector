contract c40067{
     
     
    function setName (string newName) ifAuthorised ifGeneralPartner {
        shareholders[this].name = newName;
        name = newName;
        SetName (newName);
    }
}