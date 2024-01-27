contract c18062{
    /// @notice Returns all the relevant information about a specific artwork.
    /// @param _id The ID of the artwork of interest.
    function getArtwork(uint256 _id)
        external
        view
        returns (
        uint256 birthTime,
        string name,
        string author,
        uint32 series
    ) {
        Artwork storage art = artworks[_id];
        birthTime = uint256(art.birthTime);
        name = string(art.name);
        author = string(art.author);
        series = uint32(art.series);
    }
}