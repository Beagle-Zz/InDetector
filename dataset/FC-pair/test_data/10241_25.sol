contract c10241{
    /**
     * function to remove an animal from egg phase
     * can be called from anyone in the member addresses list
     **/  
    function removeFromEggPhase(uint animalId) public
    {
        for (uint i=0;i<memberAddresses.length;i++)
        {
            if (memberAddresses[i]==msg.sender)
            {
                for (uint j=0;j<eggPhaseAnimalIds.length;j++)
                {
                    if (eggPhaseAnimalIds[j]==animalId)
                    {
                        delete eggPhaseAnimalIds[j];
                    }
                }
                animalAgainstId[animalId].eggPhase = false;
            }
        }
    }
}