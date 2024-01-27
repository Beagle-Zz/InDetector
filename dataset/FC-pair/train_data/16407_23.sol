contract c16407{
    /**
    * @dev Minimal query for battle contract
    * @return If for fusion
    */
    function queryFusionData_ext(uint _tokenId) public view returns (
        bool forFusion,
        uint fusionPrice
        ) {
        return (
        chibies[_tokenId].forFusion,
        chibies[_tokenId].fusionPrice
        );
    }
}