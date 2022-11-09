class IndexChartModel {
  
  const IndexChartModel();

  factory IndexChartModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> data = <String, dynamic>{};
    data = json;
    
    return IndexChartModel(
      
    );
  }

  @override
  String toString() {
    return '''
    ''';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }

  IndexChartModel copyWith() {
    return IndexChartModel();
  }
}
