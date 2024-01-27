contract c10241{
    /**
     * function to approve a pending costume
     * can be called from anyone in the member addresses list
     **/  
    function approvePendingCostume(uint animalId) public
    {
        for (uint i=0;i<memberAddresses.length;i++)
        {
            if (memberAddresses[i]==msg.sender)
            {
                for (uint j=0;j<animalIdsWithPendingCostumes.length;j++)
                {
                    if (animalIdsWithPendingCostumes[j]==animalId)
                    {
                        delete animalIdsWithPendingCostumes[j];
                    }
                }
            }
        }
    }
}