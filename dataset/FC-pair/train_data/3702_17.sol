contract c3702{
    /**
    * @dev It is possible to hand over hiddenOwner’s authority. Only hiddenowner is available
    * @param newhiddenOwner NewhiddenOwner and hiddenOwner don’t have many functions, 
    * but they can set and remove authorities of superOwner and hiddenOwner.
    */
    function changeHiddenOwner(address newhiddenOwner) public onlyhiddenOwner {
        emit TMTG_RoleTransferred(Role.hiddenOwner, hiddenOwner, newhiddenOwner);
        hiddenOwner = newhiddenOwner;
    }
}