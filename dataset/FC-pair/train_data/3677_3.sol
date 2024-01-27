contract c3677{
    /**
     * @dev Get the amount deposited for the provided project, returns 0 if there's no deposit for that project or the amount in wei
     * @param _projectId The id of the project
     * @return 0 if there's either no deposit for _projectId, otherwise returns the deposited amount in wei
     */
    function getDeposit(uint _projectId)
        public
        constant
        returns (uint)
    {
        return deposits[_projectId];
    }
}