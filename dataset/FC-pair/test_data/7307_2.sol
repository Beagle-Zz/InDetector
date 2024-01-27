contract c7307{
     /*======================================
     =          OWNER ONLY FUNCTIONS        =
     ======================================*/
   //give the people access to play
    function openToThePublic()
       onlyOwner()
        public
    {
        openToPublic = true;
    }
}