import Tagged_Primitives

extension GitHub.Repository.Invitation {
    /// GitHub's numeric repository-invitation identifier.
    public typealias ID = Tagged<GitHub.Repository.Invitation, UInt64>
}
