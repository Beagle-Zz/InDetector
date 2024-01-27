contract c16197{
    /// Ensure sale is in progress.
    modifier when_active { require (!campaignEnded); _;}
}