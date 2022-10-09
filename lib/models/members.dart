class Members {
  final int? id;
  final String? branchId;
  final String? repId;
  final String? name;
  final String? currentPosition;
  final String? managerId;
  final String? createdAt;
  final String? updatedAt;

  Members(
      {this.id,
      this.branchId,
      this.repId,
      this.name,
      this.currentPosition,
      this.managerId,
      this.createdAt,
      this.updatedAt});

  factory Members.fromJson(Map<String, dynamic> json) {
    return Members(
        id: json['id'] as int,
        branchId: json['branch_id'] as String,
        repId: json['rep_id'] as String,
        name: json['name'] as String,
        currentPosition: json['current_position'] as String,
        managerId: json['manager_id'] as String,
        createdAt: json['createdAt'] as String,
        updatedAt: json['updatedAt'] as String);
  }

  @override
  String toString() {
    return 'Members{name: $branchId}';
  }
}
