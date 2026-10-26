// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ProjectCharterTable extends ProjectCharter
    with TableInfo<$ProjectCharterTable, ProjectCharterData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectCharterTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _projectNameMeta = const VerificationMeta(
    'projectName',
  );
  @override
  late final GeneratedColumn<String> projectName = GeneratedColumn<String>(
    'project_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _objectivesMeta = const VerificationMeta(
    'objectives',
  );
  @override
  late final GeneratedColumn<String> objectives = GeneratedColumn<String>(
    'objectives',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scopeBoundariesMeta = const VerificationMeta(
    'scopeBoundaries',
  );
  @override
  late final GeneratedColumn<String> scopeBoundaries = GeneratedColumn<String>(
    'scope_boundaries',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _approvedBudgetMeta = const VerificationMeta(
    'approvedBudget',
  );
  @override
  late final GeneratedColumn<double> approvedBudget = GeneratedColumn<double>(
    'approved_budget',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deadlineDateMeta = const VerificationMeta(
    'deadlineDate',
  );
  @override
  late final GeneratedColumn<DateTime> deadlineDate = GeneratedColumn<DateTime>(
    'deadline_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    projectName,
    objectives,
    scopeBoundaries,
    approvedBudget,
    deadlineDate,
    status,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'project_charter';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProjectCharterData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('project_name')) {
      context.handle(
        _projectNameMeta,
        projectName.isAcceptableOrUnknown(
          data['project_name']!,
          _projectNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_projectNameMeta);
    }
    if (data.containsKey('objectives')) {
      context.handle(
        _objectivesMeta,
        objectives.isAcceptableOrUnknown(data['objectives']!, _objectivesMeta),
      );
    } else if (isInserting) {
      context.missing(_objectivesMeta);
    }
    if (data.containsKey('scope_boundaries')) {
      context.handle(
        _scopeBoundariesMeta,
        scopeBoundaries.isAcceptableOrUnknown(
          data['scope_boundaries']!,
          _scopeBoundariesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scopeBoundariesMeta);
    }
    if (data.containsKey('approved_budget')) {
      context.handle(
        _approvedBudgetMeta,
        approvedBudget.isAcceptableOrUnknown(
          data['approved_budget']!,
          _approvedBudgetMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_approvedBudgetMeta);
    }
    if (data.containsKey('deadline_date')) {
      context.handle(
        _deadlineDateMeta,
        deadlineDate.isAcceptableOrUnknown(
          data['deadline_date']!,
          _deadlineDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_deadlineDateMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProjectCharterData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectCharterData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      projectName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_name'],
      )!,
      objectives: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}objectives'],
      )!,
      scopeBoundaries: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}scope_boundaries'],
      )!,
      approvedBudget: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}approved_budget'],
      )!,
      deadlineDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deadline_date'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ProjectCharterTable createAlias(String alias) {
    return $ProjectCharterTable(attachedDatabase, alias);
  }
}

class ProjectCharterData extends DataClass
    implements Insertable<ProjectCharterData> {
  final int id;
  final String projectName;
  final String objectives;
  final String scopeBoundaries;
  final double approvedBudget;
  final DateTime deadlineDate;
  final String status;
  final DateTime createdAt;
  const ProjectCharterData({
    required this.id,
    required this.projectName,
    required this.objectives,
    required this.scopeBoundaries,
    required this.approvedBudget,
    required this.deadlineDate,
    required this.status,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['project_name'] = Variable<String>(projectName);
    map['objectives'] = Variable<String>(objectives);
    map['scope_boundaries'] = Variable<String>(scopeBoundaries);
    map['approved_budget'] = Variable<double>(approvedBudget);
    map['deadline_date'] = Variable<DateTime>(deadlineDate);
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ProjectCharterCompanion toCompanion(bool nullToAbsent) {
    return ProjectCharterCompanion(
      id: Value(id),
      projectName: Value(projectName),
      objectives: Value(objectives),
      scopeBoundaries: Value(scopeBoundaries),
      approvedBudget: Value(approvedBudget),
      deadlineDate: Value(deadlineDate),
      status: Value(status),
      createdAt: Value(createdAt),
    );
  }

  factory ProjectCharterData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectCharterData(
      id: serializer.fromJson<int>(json['id']),
      projectName: serializer.fromJson<String>(json['projectName']),
      objectives: serializer.fromJson<String>(json['objectives']),
      scopeBoundaries: serializer.fromJson<String>(json['scopeBoundaries']),
      approvedBudget: serializer.fromJson<double>(json['approvedBudget']),
      deadlineDate: serializer.fromJson<DateTime>(json['deadlineDate']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'projectName': serializer.toJson<String>(projectName),
      'objectives': serializer.toJson<String>(objectives),
      'scopeBoundaries': serializer.toJson<String>(scopeBoundaries),
      'approvedBudget': serializer.toJson<double>(approvedBudget),
      'deadlineDate': serializer.toJson<DateTime>(deadlineDate),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ProjectCharterData copyWith({
    int? id,
    String? projectName,
    String? objectives,
    String? scopeBoundaries,
    double? approvedBudget,
    DateTime? deadlineDate,
    String? status,
    DateTime? createdAt,
  }) => ProjectCharterData(
    id: id ?? this.id,
    projectName: projectName ?? this.projectName,
    objectives: objectives ?? this.objectives,
    scopeBoundaries: scopeBoundaries ?? this.scopeBoundaries,
    approvedBudget: approvedBudget ?? this.approvedBudget,
    deadlineDate: deadlineDate ?? this.deadlineDate,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
  );
  ProjectCharterData copyWithCompanion(ProjectCharterCompanion data) {
    return ProjectCharterData(
      id: data.id.present ? data.id.value : this.id,
      projectName: data.projectName.present
          ? data.projectName.value
          : this.projectName,
      objectives: data.objectives.present
          ? data.objectives.value
          : this.objectives,
      scopeBoundaries: data.scopeBoundaries.present
          ? data.scopeBoundaries.value
          : this.scopeBoundaries,
      approvedBudget: data.approvedBudget.present
          ? data.approvedBudget.value
          : this.approvedBudget,
      deadlineDate: data.deadlineDate.present
          ? data.deadlineDate.value
          : this.deadlineDate,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProjectCharterData(')
          ..write('id: $id, ')
          ..write('projectName: $projectName, ')
          ..write('objectives: $objectives, ')
          ..write('scopeBoundaries: $scopeBoundaries, ')
          ..write('approvedBudget: $approvedBudget, ')
          ..write('deadlineDate: $deadlineDate, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    projectName,
    objectives,
    scopeBoundaries,
    approvedBudget,
    deadlineDate,
    status,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectCharterData &&
          other.id == this.id &&
          other.projectName == this.projectName &&
          other.objectives == this.objectives &&
          other.scopeBoundaries == this.scopeBoundaries &&
          other.approvedBudget == this.approvedBudget &&
          other.deadlineDate == this.deadlineDate &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class ProjectCharterCompanion extends UpdateCompanion<ProjectCharterData> {
  final Value<int> id;
  final Value<String> projectName;
  final Value<String> objectives;
  final Value<String> scopeBoundaries;
  final Value<double> approvedBudget;
  final Value<DateTime> deadlineDate;
  final Value<String> status;
  final Value<DateTime> createdAt;
  const ProjectCharterCompanion({
    this.id = const Value.absent(),
    this.projectName = const Value.absent(),
    this.objectives = const Value.absent(),
    this.scopeBoundaries = const Value.absent(),
    this.approvedBudget = const Value.absent(),
    this.deadlineDate = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ProjectCharterCompanion.insert({
    this.id = const Value.absent(),
    required String projectName,
    required String objectives,
    required String scopeBoundaries,
    required double approvedBudget,
    required DateTime deadlineDate,
    required String status,
    required DateTime createdAt,
  }) : projectName = Value(projectName),
       objectives = Value(objectives),
       scopeBoundaries = Value(scopeBoundaries),
       approvedBudget = Value(approvedBudget),
       deadlineDate = Value(deadlineDate),
       status = Value(status),
       createdAt = Value(createdAt);
  static Insertable<ProjectCharterData> custom({
    Expression<int>? id,
    Expression<String>? projectName,
    Expression<String>? objectives,
    Expression<String>? scopeBoundaries,
    Expression<double>? approvedBudget,
    Expression<DateTime>? deadlineDate,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectName != null) 'project_name': projectName,
      if (objectives != null) 'objectives': objectives,
      if (scopeBoundaries != null) 'scope_boundaries': scopeBoundaries,
      if (approvedBudget != null) 'approved_budget': approvedBudget,
      if (deadlineDate != null) 'deadline_date': deadlineDate,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ProjectCharterCompanion copyWith({
    Value<int>? id,
    Value<String>? projectName,
    Value<String>? objectives,
    Value<String>? scopeBoundaries,
    Value<double>? approvedBudget,
    Value<DateTime>? deadlineDate,
    Value<String>? status,
    Value<DateTime>? createdAt,
  }) {
    return ProjectCharterCompanion(
      id: id ?? this.id,
      projectName: projectName ?? this.projectName,
      objectives: objectives ?? this.objectives,
      scopeBoundaries: scopeBoundaries ?? this.scopeBoundaries,
      approvedBudget: approvedBudget ?? this.approvedBudget,
      deadlineDate: deadlineDate ?? this.deadlineDate,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (projectName.present) {
      map['project_name'] = Variable<String>(projectName.value);
    }
    if (objectives.present) {
      map['objectives'] = Variable<String>(objectives.value);
    }
    if (scopeBoundaries.present) {
      map['scope_boundaries'] = Variable<String>(scopeBoundaries.value);
    }
    if (approvedBudget.present) {
      map['approved_budget'] = Variable<double>(approvedBudget.value);
    }
    if (deadlineDate.present) {
      map['deadline_date'] = Variable<DateTime>(deadlineDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectCharterCompanion(')
          ..write('id: $id, ')
          ..write('projectName: $projectName, ')
          ..write('objectives: $objectives, ')
          ..write('scopeBoundaries: $scopeBoundaries, ')
          ..write('approvedBudget: $approvedBudget, ')
          ..write('deadlineDate: $deadlineDate, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $StakeholdersTable extends Stakeholders
    with TableInfo<$StakeholdersTable, Stakeholder> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StakeholdersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contactMeta = const VerificationMeta(
    'contact',
  );
  @override
  late final GeneratedColumn<String> contact = GeneratedColumn<String>(
    'contact',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _influenceLevelMeta = const VerificationMeta(
    'influenceLevel',
  );
  @override
  late final GeneratedColumn<String> influenceLevel = GeneratedColumn<String>(
    'influence_level',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    role,
    contact,
    influenceLevel,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stakeholders';
  @override
  VerificationContext validateIntegrity(
    Insertable<Stakeholder> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('contact')) {
      context.handle(
        _contactMeta,
        contact.isAcceptableOrUnknown(data['contact']!, _contactMeta),
      );
    } else if (isInserting) {
      context.missing(_contactMeta);
    }
    if (data.containsKey('influence_level')) {
      context.handle(
        _influenceLevelMeta,
        influenceLevel.isAcceptableOrUnknown(
          data['influence_level']!,
          _influenceLevelMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_influenceLevelMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Stakeholder map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Stakeholder(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      contact: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contact'],
      )!,
      influenceLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}influence_level'],
      )!,
    );
  }

  @override
  $StakeholdersTable createAlias(String alias) {
    return $StakeholdersTable(attachedDatabase, alias);
  }
}

class Stakeholder extends DataClass implements Insertable<Stakeholder> {
  final int id;
  final String name;
  final String role;
  final String contact;
  final String influenceLevel;
  const Stakeholder({
    required this.id,
    required this.name,
    required this.role,
    required this.contact,
    required this.influenceLevel,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['role'] = Variable<String>(role);
    map['contact'] = Variable<String>(contact);
    map['influence_level'] = Variable<String>(influenceLevel);
    return map;
  }

  StakeholdersCompanion toCompanion(bool nullToAbsent) {
    return StakeholdersCompanion(
      id: Value(id),
      name: Value(name),
      role: Value(role),
      contact: Value(contact),
      influenceLevel: Value(influenceLevel),
    );
  }

  factory Stakeholder.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Stakeholder(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      role: serializer.fromJson<String>(json['role']),
      contact: serializer.fromJson<String>(json['contact']),
      influenceLevel: serializer.fromJson<String>(json['influenceLevel']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'role': serializer.toJson<String>(role),
      'contact': serializer.toJson<String>(contact),
      'influenceLevel': serializer.toJson<String>(influenceLevel),
    };
  }

  Stakeholder copyWith({
    int? id,
    String? name,
    String? role,
    String? contact,
    String? influenceLevel,
  }) => Stakeholder(
    id: id ?? this.id,
    name: name ?? this.name,
    role: role ?? this.role,
    contact: contact ?? this.contact,
    influenceLevel: influenceLevel ?? this.influenceLevel,
  );
  Stakeholder copyWithCompanion(StakeholdersCompanion data) {
    return Stakeholder(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      role: data.role.present ? data.role.value : this.role,
      contact: data.contact.present ? data.contact.value : this.contact,
      influenceLevel: data.influenceLevel.present
          ? data.influenceLevel.value
          : this.influenceLevel,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Stakeholder(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('role: $role, ')
          ..write('contact: $contact, ')
          ..write('influenceLevel: $influenceLevel')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, role, contact, influenceLevel);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Stakeholder &&
          other.id == this.id &&
          other.name == this.name &&
          other.role == this.role &&
          other.contact == this.contact &&
          other.influenceLevel == this.influenceLevel);
}

class StakeholdersCompanion extends UpdateCompanion<Stakeholder> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> role;
  final Value<String> contact;
  final Value<String> influenceLevel;
  const StakeholdersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.role = const Value.absent(),
    this.contact = const Value.absent(),
    this.influenceLevel = const Value.absent(),
  });
  StakeholdersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String role,
    required String contact,
    required String influenceLevel,
  }) : name = Value(name),
       role = Value(role),
       contact = Value(contact),
       influenceLevel = Value(influenceLevel);
  static Insertable<Stakeholder> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? role,
    Expression<String>? contact,
    Expression<String>? influenceLevel,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (role != null) 'role': role,
      if (contact != null) 'contact': contact,
      if (influenceLevel != null) 'influence_level': influenceLevel,
    });
  }

  StakeholdersCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? role,
    Value<String>? contact,
    Value<String>? influenceLevel,
  }) {
    return StakeholdersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      role: role ?? this.role,
      contact: contact ?? this.contact,
      influenceLevel: influenceLevel ?? this.influenceLevel,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (contact.present) {
      map['contact'] = Variable<String>(contact.value);
    }
    if (influenceLevel.present) {
      map['influence_level'] = Variable<String>(influenceLevel.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StakeholdersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('role: $role, ')
          ..write('contact: $contact, ')
          ..write('influenceLevel: $influenceLevel')
          ..write(')'))
        .toString();
  }
}

class $RequirementsTable extends Requirements
    with TableInfo<$RequirementsTable, Requirement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RequirementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priorityMeta = const VerificationMeta(
    'priority',
  );
  @override
  late final GeneratedColumn<String> priority = GeneratedColumn<String>(
    'priority',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isInScopeMeta = const VerificationMeta(
    'isInScope',
  );
  @override
  late final GeneratedColumn<bool> isInScope = GeneratedColumn<bool>(
    'is_in_scope',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_in_scope" IN (0, 1))',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    priority,
    status,
    isInScope,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'requirements';
  @override
  VerificationContext validateIntegrity(
    Insertable<Requirement> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(
        _priorityMeta,
        priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta),
      );
    } else if (isInserting) {
      context.missing(_priorityMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('is_in_scope')) {
      context.handle(
        _isInScopeMeta,
        isInScope.isAcceptableOrUnknown(data['is_in_scope']!, _isInScopeMeta),
      );
    } else if (isInserting) {
      context.missing(_isInScopeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Requirement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Requirement(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      priority: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}priority'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      isInScope: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_in_scope'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $RequirementsTable createAlias(String alias) {
    return $RequirementsTable(attachedDatabase, alias);
  }
}

class Requirement extends DataClass implements Insertable<Requirement> {
  final int id;
  final String title;
  final String description;
  final String priority;
  final String status;
  final bool isInScope;
  final DateTime createdAt;
  const Requirement({
    required this.id,
    required this.title,
    required this.description,
    required this.priority,
    required this.status,
    required this.isInScope,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['priority'] = Variable<String>(priority);
    map['status'] = Variable<String>(status);
    map['is_in_scope'] = Variable<bool>(isInScope);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  RequirementsCompanion toCompanion(bool nullToAbsent) {
    return RequirementsCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      priority: Value(priority),
      status: Value(status),
      isInScope: Value(isInScope),
      createdAt: Value(createdAt),
    );
  }

  factory Requirement.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Requirement(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      priority: serializer.fromJson<String>(json['priority']),
      status: serializer.fromJson<String>(json['status']),
      isInScope: serializer.fromJson<bool>(json['isInScope']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'priority': serializer.toJson<String>(priority),
      'status': serializer.toJson<String>(status),
      'isInScope': serializer.toJson<bool>(isInScope),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Requirement copyWith({
    int? id,
    String? title,
    String? description,
    String? priority,
    String? status,
    bool? isInScope,
    DateTime? createdAt,
  }) => Requirement(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    priority: priority ?? this.priority,
    status: status ?? this.status,
    isInScope: isInScope ?? this.isInScope,
    createdAt: createdAt ?? this.createdAt,
  );
  Requirement copyWithCompanion(RequirementsCompanion data) {
    return Requirement(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      priority: data.priority.present ? data.priority.value : this.priority,
      status: data.status.present ? data.status.value : this.status,
      isInScope: data.isInScope.present ? data.isInScope.value : this.isInScope,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Requirement(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('priority: $priority, ')
          ..write('status: $status, ')
          ..write('isInScope: $isInScope, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    description,
    priority,
    status,
    isInScope,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Requirement &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.priority == this.priority &&
          other.status == this.status &&
          other.isInScope == this.isInScope &&
          other.createdAt == this.createdAt);
}

class RequirementsCompanion extends UpdateCompanion<Requirement> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> priority;
  final Value<String> status;
  final Value<bool> isInScope;
  final Value<DateTime> createdAt;
  const RequirementsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.priority = const Value.absent(),
    this.status = const Value.absent(),
    this.isInScope = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  RequirementsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required String priority,
    required String status,
    required bool isInScope,
    required DateTime createdAt,
  }) : title = Value(title),
       description = Value(description),
       priority = Value(priority),
       status = Value(status),
       isInScope = Value(isInScope),
       createdAt = Value(createdAt);
  static Insertable<Requirement> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? priority,
    Expression<String>? status,
    Expression<bool>? isInScope,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (priority != null) 'priority': priority,
      if (status != null) 'status': status,
      if (isInScope != null) 'is_in_scope': isInScope,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  RequirementsCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? description,
    Value<String>? priority,
    Value<String>? status,
    Value<bool>? isInScope,
    Value<DateTime>? createdAt,
  }) {
    return RequirementsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      isInScope: isInScope ?? this.isInScope,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>(priority.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (isInScope.present) {
      map['is_in_scope'] = Variable<bool>(isInScope.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RequirementsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('priority: $priority, ')
          ..write('status: $status, ')
          ..write('isInScope: $isInScope, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $WbsNodesTable extends WbsNodes with TableInfo<$WbsNodesTable, WbsNode> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WbsNodesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _parentIdMeta = const VerificationMeta(
    'parentId',
  );
  @override
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
    'parent_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
    'level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deliverableTypeMeta = const VerificationMeta(
    'deliverableType',
  );
  @override
  late final GeneratedColumn<String> deliverableType = GeneratedColumn<String>(
    'deliverable_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _linkedRequirementIdMeta =
      const VerificationMeta('linkedRequirementId');
  @override
  late final GeneratedColumn<int> linkedRequirementId = GeneratedColumn<int>(
    'linked_requirement_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    parentId,
    title,
    level,
    deliverableType,
    linkedRequirementId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'wbs_nodes';
  @override
  VerificationContext validateIntegrity(
    Insertable<WbsNode> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('parent_id')) {
      context.handle(
        _parentIdMeta,
        parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
        _levelMeta,
        level.isAcceptableOrUnknown(data['level']!, _levelMeta),
      );
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    if (data.containsKey('deliverable_type')) {
      context.handle(
        _deliverableTypeMeta,
        deliverableType.isAcceptableOrUnknown(
          data['deliverable_type']!,
          _deliverableTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_deliverableTypeMeta);
    }
    if (data.containsKey('linked_requirement_id')) {
      context.handle(
        _linkedRequirementIdMeta,
        linkedRequirementId.isAcceptableOrUnknown(
          data['linked_requirement_id']!,
          _linkedRequirementIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WbsNode map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WbsNode(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}parent_id'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      level: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}level'],
      )!,
      deliverableType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}deliverable_type'],
      )!,
      linkedRequirementId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}linked_requirement_id'],
      ),
    );
  }

  @override
  $WbsNodesTable createAlias(String alias) {
    return $WbsNodesTable(attachedDatabase, alias);
  }
}

class WbsNode extends DataClass implements Insertable<WbsNode> {
  final int id;
  final int? parentId;
  final String title;
  final int level;
  final String deliverableType;
  final int? linkedRequirementId;
  const WbsNode({
    required this.id,
    this.parentId,
    required this.title,
    required this.level,
    required this.deliverableType,
    this.linkedRequirementId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<int>(parentId);
    }
    map['title'] = Variable<String>(title);
    map['level'] = Variable<int>(level);
    map['deliverable_type'] = Variable<String>(deliverableType);
    if (!nullToAbsent || linkedRequirementId != null) {
      map['linked_requirement_id'] = Variable<int>(linkedRequirementId);
    }
    return map;
  }

  WbsNodesCompanion toCompanion(bool nullToAbsent) {
    return WbsNodesCompanion(
      id: Value(id),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
      title: Value(title),
      level: Value(level),
      deliverableType: Value(deliverableType),
      linkedRequirementId: linkedRequirementId == null && nullToAbsent
          ? const Value.absent()
          : Value(linkedRequirementId),
    );
  }

  factory WbsNode.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WbsNode(
      id: serializer.fromJson<int>(json['id']),
      parentId: serializer.fromJson<int?>(json['parentId']),
      title: serializer.fromJson<String>(json['title']),
      level: serializer.fromJson<int>(json['level']),
      deliverableType: serializer.fromJson<String>(json['deliverableType']),
      linkedRequirementId: serializer.fromJson<int?>(
        json['linkedRequirementId'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'parentId': serializer.toJson<int?>(parentId),
      'title': serializer.toJson<String>(title),
      'level': serializer.toJson<int>(level),
      'deliverableType': serializer.toJson<String>(deliverableType),
      'linkedRequirementId': serializer.toJson<int?>(linkedRequirementId),
    };
  }

  WbsNode copyWith({
    int? id,
    Value<int?> parentId = const Value.absent(),
    String? title,
    int? level,
    String? deliverableType,
    Value<int?> linkedRequirementId = const Value.absent(),
  }) => WbsNode(
    id: id ?? this.id,
    parentId: parentId.present ? parentId.value : this.parentId,
    title: title ?? this.title,
    level: level ?? this.level,
    deliverableType: deliverableType ?? this.deliverableType,
    linkedRequirementId: linkedRequirementId.present
        ? linkedRequirementId.value
        : this.linkedRequirementId,
  );
  WbsNode copyWithCompanion(WbsNodesCompanion data) {
    return WbsNode(
      id: data.id.present ? data.id.value : this.id,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      title: data.title.present ? data.title.value : this.title,
      level: data.level.present ? data.level.value : this.level,
      deliverableType: data.deliverableType.present
          ? data.deliverableType.value
          : this.deliverableType,
      linkedRequirementId: data.linkedRequirementId.present
          ? data.linkedRequirementId.value
          : this.linkedRequirementId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WbsNode(')
          ..write('id: $id, ')
          ..write('parentId: $parentId, ')
          ..write('title: $title, ')
          ..write('level: $level, ')
          ..write('deliverableType: $deliverableType, ')
          ..write('linkedRequirementId: $linkedRequirementId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    parentId,
    title,
    level,
    deliverableType,
    linkedRequirementId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WbsNode &&
          other.id == this.id &&
          other.parentId == this.parentId &&
          other.title == this.title &&
          other.level == this.level &&
          other.deliverableType == this.deliverableType &&
          other.linkedRequirementId == this.linkedRequirementId);
}

class WbsNodesCompanion extends UpdateCompanion<WbsNode> {
  final Value<int> id;
  final Value<int?> parentId;
  final Value<String> title;
  final Value<int> level;
  final Value<String> deliverableType;
  final Value<int?> linkedRequirementId;
  const WbsNodesCompanion({
    this.id = const Value.absent(),
    this.parentId = const Value.absent(),
    this.title = const Value.absent(),
    this.level = const Value.absent(),
    this.deliverableType = const Value.absent(),
    this.linkedRequirementId = const Value.absent(),
  });
  WbsNodesCompanion.insert({
    this.id = const Value.absent(),
    this.parentId = const Value.absent(),
    required String title,
    required int level,
    required String deliverableType,
    this.linkedRequirementId = const Value.absent(),
  }) : title = Value(title),
       level = Value(level),
       deliverableType = Value(deliverableType);
  static Insertable<WbsNode> custom({
    Expression<int>? id,
    Expression<int>? parentId,
    Expression<String>? title,
    Expression<int>? level,
    Expression<String>? deliverableType,
    Expression<int>? linkedRequirementId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (parentId != null) 'parent_id': parentId,
      if (title != null) 'title': title,
      if (level != null) 'level': level,
      if (deliverableType != null) 'deliverable_type': deliverableType,
      if (linkedRequirementId != null)
        'linked_requirement_id': linkedRequirementId,
    });
  }

  WbsNodesCompanion copyWith({
    Value<int>? id,
    Value<int?>? parentId,
    Value<String>? title,
    Value<int>? level,
    Value<String>? deliverableType,
    Value<int?>? linkedRequirementId,
  }) {
    return WbsNodesCompanion(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      title: title ?? this.title,
      level: level ?? this.level,
      deliverableType: deliverableType ?? this.deliverableType,
      linkedRequirementId: linkedRequirementId ?? this.linkedRequirementId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (deliverableType.present) {
      map['deliverable_type'] = Variable<String>(deliverableType.value);
    }
    if (linkedRequirementId.present) {
      map['linked_requirement_id'] = Variable<int>(linkedRequirementId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WbsNodesCompanion(')
          ..write('id: $id, ')
          ..write('parentId: $parentId, ')
          ..write('title: $title, ')
          ..write('level: $level, ')
          ..write('deliverableType: $deliverableType, ')
          ..write('linkedRequirementId: $linkedRequirementId')
          ..write(')'))
        .toString();
  }
}

class $ChangeRequestsTable extends ChangeRequests
    with TableInfo<$ChangeRequestsTable, ChangeRequest> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChangeRequestsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _justificationMeta = const VerificationMeta(
    'justification',
  );
  @override
  late final GeneratedColumn<String> justification = GeneratedColumn<String>(
    'justification',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _costImpactMeta = const VerificationMeta(
    'costImpact',
  );
  @override
  late final GeneratedColumn<double> costImpact = GeneratedColumn<double>(
    'cost_impact',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scheduleImpactDaysMeta =
      const VerificationMeta('scheduleImpactDays');
  @override
  late final GeneratedColumn<int> scheduleImpactDays = GeneratedColumn<int>(
    'schedule_impact_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _submittedAtMeta = const VerificationMeta(
    'submittedAt',
  );
  @override
  late final GeneratedColumn<DateTime> submittedAt = GeneratedColumn<DateTime>(
    'submitted_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _decidedAtMeta = const VerificationMeta(
    'decidedAt',
  );
  @override
  late final GeneratedColumn<DateTime> decidedAt = GeneratedColumn<DateTime>(
    'decided_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _affectsMeta = const VerificationMeta(
    'affects',
  );
  @override
  late final GeneratedColumn<String> affects = GeneratedColumn<String>(
    'affects',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    justification,
    costImpact,
    scheduleImpactDays,
    status,
    submittedAt,
    decidedAt,
    affects,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'change_requests';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChangeRequest> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('justification')) {
      context.handle(
        _justificationMeta,
        justification.isAcceptableOrUnknown(
          data['justification']!,
          _justificationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_justificationMeta);
    }
    if (data.containsKey('cost_impact')) {
      context.handle(
        _costImpactMeta,
        costImpact.isAcceptableOrUnknown(data['cost_impact']!, _costImpactMeta),
      );
    } else if (isInserting) {
      context.missing(_costImpactMeta);
    }
    if (data.containsKey('schedule_impact_days')) {
      context.handle(
        _scheduleImpactDaysMeta,
        scheduleImpactDays.isAcceptableOrUnknown(
          data['schedule_impact_days']!,
          _scheduleImpactDaysMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduleImpactDaysMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('submitted_at')) {
      context.handle(
        _submittedAtMeta,
        submittedAt.isAcceptableOrUnknown(
          data['submitted_at']!,
          _submittedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_submittedAtMeta);
    }
    if (data.containsKey('decided_at')) {
      context.handle(
        _decidedAtMeta,
        decidedAt.isAcceptableOrUnknown(data['decided_at']!, _decidedAtMeta),
      );
    }
    if (data.containsKey('affects')) {
      context.handle(
        _affectsMeta,
        affects.isAcceptableOrUnknown(data['affects']!, _affectsMeta),
      );
    } else if (isInserting) {
      context.missing(_affectsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChangeRequest map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChangeRequest(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      justification: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}justification'],
      )!,
      costImpact: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cost_impact'],
      )!,
      scheduleImpactDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}schedule_impact_days'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      submittedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}submitted_at'],
      )!,
      decidedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}decided_at'],
      ),
      affects: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}affects'],
      )!,
    );
  }

  @override
  $ChangeRequestsTable createAlias(String alias) {
    return $ChangeRequestsTable(attachedDatabase, alias);
  }
}

class ChangeRequest extends DataClass implements Insertable<ChangeRequest> {
  final int id;
  final String title;
  final String justification;
  final double costImpact;
  final int scheduleImpactDays;
  final String status;
  final DateTime submittedAt;
  final DateTime? decidedAt;
  final String affects;
  const ChangeRequest({
    required this.id,
    required this.title,
    required this.justification,
    required this.costImpact,
    required this.scheduleImpactDays,
    required this.status,
    required this.submittedAt,
    this.decidedAt,
    required this.affects,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['justification'] = Variable<String>(justification);
    map['cost_impact'] = Variable<double>(costImpact);
    map['schedule_impact_days'] = Variable<int>(scheduleImpactDays);
    map['status'] = Variable<String>(status);
    map['submitted_at'] = Variable<DateTime>(submittedAt);
    if (!nullToAbsent || decidedAt != null) {
      map['decided_at'] = Variable<DateTime>(decidedAt);
    }
    map['affects'] = Variable<String>(affects);
    return map;
  }

  ChangeRequestsCompanion toCompanion(bool nullToAbsent) {
    return ChangeRequestsCompanion(
      id: Value(id),
      title: Value(title),
      justification: Value(justification),
      costImpact: Value(costImpact),
      scheduleImpactDays: Value(scheduleImpactDays),
      status: Value(status),
      submittedAt: Value(submittedAt),
      decidedAt: decidedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(decidedAt),
      affects: Value(affects),
    );
  }

  factory ChangeRequest.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChangeRequest(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      justification: serializer.fromJson<String>(json['justification']),
      costImpact: serializer.fromJson<double>(json['costImpact']),
      scheduleImpactDays: serializer.fromJson<int>(json['scheduleImpactDays']),
      status: serializer.fromJson<String>(json['status']),
      submittedAt: serializer.fromJson<DateTime>(json['submittedAt']),
      decidedAt: serializer.fromJson<DateTime?>(json['decidedAt']),
      affects: serializer.fromJson<String>(json['affects']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'justification': serializer.toJson<String>(justification),
      'costImpact': serializer.toJson<double>(costImpact),
      'scheduleImpactDays': serializer.toJson<int>(scheduleImpactDays),
      'status': serializer.toJson<String>(status),
      'submittedAt': serializer.toJson<DateTime>(submittedAt),
      'decidedAt': serializer.toJson<DateTime?>(decidedAt),
      'affects': serializer.toJson<String>(affects),
    };
  }

  ChangeRequest copyWith({
    int? id,
    String? title,
    String? justification,
    double? costImpact,
    int? scheduleImpactDays,
    String? status,
    DateTime? submittedAt,
    Value<DateTime?> decidedAt = const Value.absent(),
    String? affects,
  }) => ChangeRequest(
    id: id ?? this.id,
    title: title ?? this.title,
    justification: justification ?? this.justification,
    costImpact: costImpact ?? this.costImpact,
    scheduleImpactDays: scheduleImpactDays ?? this.scheduleImpactDays,
    status: status ?? this.status,
    submittedAt: submittedAt ?? this.submittedAt,
    decidedAt: decidedAt.present ? decidedAt.value : this.decidedAt,
    affects: affects ?? this.affects,
  );
  ChangeRequest copyWithCompanion(ChangeRequestsCompanion data) {
    return ChangeRequest(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      justification: data.justification.present
          ? data.justification.value
          : this.justification,
      costImpact: data.costImpact.present
          ? data.costImpact.value
          : this.costImpact,
      scheduleImpactDays: data.scheduleImpactDays.present
          ? data.scheduleImpactDays.value
          : this.scheduleImpactDays,
      status: data.status.present ? data.status.value : this.status,
      submittedAt: data.submittedAt.present
          ? data.submittedAt.value
          : this.submittedAt,
      decidedAt: data.decidedAt.present ? data.decidedAt.value : this.decidedAt,
      affects: data.affects.present ? data.affects.value : this.affects,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChangeRequest(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('justification: $justification, ')
          ..write('costImpact: $costImpact, ')
          ..write('scheduleImpactDays: $scheduleImpactDays, ')
          ..write('status: $status, ')
          ..write('submittedAt: $submittedAt, ')
          ..write('decidedAt: $decidedAt, ')
          ..write('affects: $affects')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    justification,
    costImpact,
    scheduleImpactDays,
    status,
    submittedAt,
    decidedAt,
    affects,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChangeRequest &&
          other.id == this.id &&
          other.title == this.title &&
          other.justification == this.justification &&
          other.costImpact == this.costImpact &&
          other.scheduleImpactDays == this.scheduleImpactDays &&
          other.status == this.status &&
          other.submittedAt == this.submittedAt &&
          other.decidedAt == this.decidedAt &&
          other.affects == this.affects);
}

class ChangeRequestsCompanion extends UpdateCompanion<ChangeRequest> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> justification;
  final Value<double> costImpact;
  final Value<int> scheduleImpactDays;
  final Value<String> status;
  final Value<DateTime> submittedAt;
  final Value<DateTime?> decidedAt;
  final Value<String> affects;
  const ChangeRequestsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.justification = const Value.absent(),
    this.costImpact = const Value.absent(),
    this.scheduleImpactDays = const Value.absent(),
    this.status = const Value.absent(),
    this.submittedAt = const Value.absent(),
    this.decidedAt = const Value.absent(),
    this.affects = const Value.absent(),
  });
  ChangeRequestsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String justification,
    required double costImpact,
    required int scheduleImpactDays,
    required String status,
    required DateTime submittedAt,
    this.decidedAt = const Value.absent(),
    required String affects,
  }) : title = Value(title),
       justification = Value(justification),
       costImpact = Value(costImpact),
       scheduleImpactDays = Value(scheduleImpactDays),
       status = Value(status),
       submittedAt = Value(submittedAt),
       affects = Value(affects);
  static Insertable<ChangeRequest> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? justification,
    Expression<double>? costImpact,
    Expression<int>? scheduleImpactDays,
    Expression<String>? status,
    Expression<DateTime>? submittedAt,
    Expression<DateTime>? decidedAt,
    Expression<String>? affects,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (justification != null) 'justification': justification,
      if (costImpact != null) 'cost_impact': costImpact,
      if (scheduleImpactDays != null)
        'schedule_impact_days': scheduleImpactDays,
      if (status != null) 'status': status,
      if (submittedAt != null) 'submitted_at': submittedAt,
      if (decidedAt != null) 'decided_at': decidedAt,
      if (affects != null) 'affects': affects,
    });
  }

  ChangeRequestsCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? justification,
    Value<double>? costImpact,
    Value<int>? scheduleImpactDays,
    Value<String>? status,
    Value<DateTime>? submittedAt,
    Value<DateTime?>? decidedAt,
    Value<String>? affects,
  }) {
    return ChangeRequestsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      justification: justification ?? this.justification,
      costImpact: costImpact ?? this.costImpact,
      scheduleImpactDays: scheduleImpactDays ?? this.scheduleImpactDays,
      status: status ?? this.status,
      submittedAt: submittedAt ?? this.submittedAt,
      decidedAt: decidedAt ?? this.decidedAt,
      affects: affects ?? this.affects,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (justification.present) {
      map['justification'] = Variable<String>(justification.value);
    }
    if (costImpact.present) {
      map['cost_impact'] = Variable<double>(costImpact.value);
    }
    if (scheduleImpactDays.present) {
      map['schedule_impact_days'] = Variable<int>(scheduleImpactDays.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (submittedAt.present) {
      map['submitted_at'] = Variable<DateTime>(submittedAt.value);
    }
    if (decidedAt.present) {
      map['decided_at'] = Variable<DateTime>(decidedAt.value);
    }
    if (affects.present) {
      map['affects'] = Variable<String>(affects.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChangeRequestsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('justification: $justification, ')
          ..write('costImpact: $costImpact, ')
          ..write('scheduleImpactDays: $scheduleImpactDays, ')
          ..write('status: $status, ')
          ..write('submittedAt: $submittedAt, ')
          ..write('decidedAt: $decidedAt, ')
          ..write('affects: $affects')
          ..write(')'))
        .toString();
  }
}

class $ActivitiesTable extends Activities
    with TableInfo<$ActivitiesTable, Activity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActivitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _wbsNodeIdMeta = const VerificationMeta(
    'wbsNodeId',
  );
  @override
  late final GeneratedColumn<int> wbsNodeId = GeneratedColumn<int>(
    'wbs_node_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _assignedToMeta = const VerificationMeta(
    'assignedTo',
  );
  @override
  late final GeneratedColumn<int> assignedTo = GeneratedColumn<int>(
    'assigned_to',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _estimatedDurationDaysMeta =
      const VerificationMeta('estimatedDurationDays');
  @override
  late final GeneratedColumn<int> estimatedDurationDays = GeneratedColumn<int>(
    'estimated_duration_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _plannedStartMeta = const VerificationMeta(
    'plannedStart',
  );
  @override
  late final GeneratedColumn<DateTime> plannedStart = GeneratedColumn<DateTime>(
    'planned_start',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _plannedEndMeta = const VerificationMeta(
    'plannedEnd',
  );
  @override
  late final GeneratedColumn<DateTime> plannedEnd = GeneratedColumn<DateTime>(
    'planned_end',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actualStartMeta = const VerificationMeta(
    'actualStart',
  );
  @override
  late final GeneratedColumn<DateTime> actualStart = GeneratedColumn<DateTime>(
    'actual_start',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _actualEndMeta = const VerificationMeta(
    'actualEnd',
  );
  @override
  late final GeneratedColumn<DateTime> actualEnd = GeneratedColumn<DateTime>(
    'actual_end',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _percentCompleteMeta = const VerificationMeta(
    'percentComplete',
  );
  @override
  late final GeneratedColumn<double> percentComplete = GeneratedColumn<double>(
    'percent_complete',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    wbsNodeId,
    name,
    assignedTo,
    estimatedDurationDays,
    plannedStart,
    plannedEnd,
    actualStart,
    actualEnd,
    status,
    percentComplete,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'activities';
  @override
  VerificationContext validateIntegrity(
    Insertable<Activity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('wbs_node_id')) {
      context.handle(
        _wbsNodeIdMeta,
        wbsNodeId.isAcceptableOrUnknown(data['wbs_node_id']!, _wbsNodeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_wbsNodeIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('assigned_to')) {
      context.handle(
        _assignedToMeta,
        assignedTo.isAcceptableOrUnknown(data['assigned_to']!, _assignedToMeta),
      );
    }
    if (data.containsKey('estimated_duration_days')) {
      context.handle(
        _estimatedDurationDaysMeta,
        estimatedDurationDays.isAcceptableOrUnknown(
          data['estimated_duration_days']!,
          _estimatedDurationDaysMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_estimatedDurationDaysMeta);
    }
    if (data.containsKey('planned_start')) {
      context.handle(
        _plannedStartMeta,
        plannedStart.isAcceptableOrUnknown(
          data['planned_start']!,
          _plannedStartMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_plannedStartMeta);
    }
    if (data.containsKey('planned_end')) {
      context.handle(
        _plannedEndMeta,
        plannedEnd.isAcceptableOrUnknown(data['planned_end']!, _plannedEndMeta),
      );
    } else if (isInserting) {
      context.missing(_plannedEndMeta);
    }
    if (data.containsKey('actual_start')) {
      context.handle(
        _actualStartMeta,
        actualStart.isAcceptableOrUnknown(
          data['actual_start']!,
          _actualStartMeta,
        ),
      );
    }
    if (data.containsKey('actual_end')) {
      context.handle(
        _actualEndMeta,
        actualEnd.isAcceptableOrUnknown(data['actual_end']!, _actualEndMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('percent_complete')) {
      context.handle(
        _percentCompleteMeta,
        percentComplete.isAcceptableOrUnknown(
          data['percent_complete']!,
          _percentCompleteMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_percentCompleteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Activity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Activity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      wbsNodeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}wbs_node_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      assignedTo: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}assigned_to'],
      ),
      estimatedDurationDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}estimated_duration_days'],
      )!,
      plannedStart: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}planned_start'],
      )!,
      plannedEnd: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}planned_end'],
      )!,
      actualStart: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}actual_start'],
      ),
      actualEnd: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}actual_end'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      percentComplete: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}percent_complete'],
      )!,
    );
  }

  @override
  $ActivitiesTable createAlias(String alias) {
    return $ActivitiesTable(attachedDatabase, alias);
  }
}

class Activity extends DataClass implements Insertable<Activity> {
  final int id;
  final int wbsNodeId;
  final String name;
  final int? assignedTo;
  final int estimatedDurationDays;
  final DateTime plannedStart;
  final DateTime plannedEnd;
  final DateTime? actualStart;
  final DateTime? actualEnd;
  final String status;
  final double percentComplete;
  const Activity({
    required this.id,
    required this.wbsNodeId,
    required this.name,
    this.assignedTo,
    required this.estimatedDurationDays,
    required this.plannedStart,
    required this.plannedEnd,
    this.actualStart,
    this.actualEnd,
    required this.status,
    required this.percentComplete,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['wbs_node_id'] = Variable<int>(wbsNodeId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || assignedTo != null) {
      map['assigned_to'] = Variable<int>(assignedTo);
    }
    map['estimated_duration_days'] = Variable<int>(estimatedDurationDays);
    map['planned_start'] = Variable<DateTime>(plannedStart);
    map['planned_end'] = Variable<DateTime>(plannedEnd);
    if (!nullToAbsent || actualStart != null) {
      map['actual_start'] = Variable<DateTime>(actualStart);
    }
    if (!nullToAbsent || actualEnd != null) {
      map['actual_end'] = Variable<DateTime>(actualEnd);
    }
    map['status'] = Variable<String>(status);
    map['percent_complete'] = Variable<double>(percentComplete);
    return map;
  }

  ActivitiesCompanion toCompanion(bool nullToAbsent) {
    return ActivitiesCompanion(
      id: Value(id),
      wbsNodeId: Value(wbsNodeId),
      name: Value(name),
      assignedTo: assignedTo == null && nullToAbsent
          ? const Value.absent()
          : Value(assignedTo),
      estimatedDurationDays: Value(estimatedDurationDays),
      plannedStart: Value(plannedStart),
      plannedEnd: Value(plannedEnd),
      actualStart: actualStart == null && nullToAbsent
          ? const Value.absent()
          : Value(actualStart),
      actualEnd: actualEnd == null && nullToAbsent
          ? const Value.absent()
          : Value(actualEnd),
      status: Value(status),
      percentComplete: Value(percentComplete),
    );
  }

  factory Activity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Activity(
      id: serializer.fromJson<int>(json['id']),
      wbsNodeId: serializer.fromJson<int>(json['wbsNodeId']),
      name: serializer.fromJson<String>(json['name']),
      assignedTo: serializer.fromJson<int?>(json['assignedTo']),
      estimatedDurationDays: serializer.fromJson<int>(
        json['estimatedDurationDays'],
      ),
      plannedStart: serializer.fromJson<DateTime>(json['plannedStart']),
      plannedEnd: serializer.fromJson<DateTime>(json['plannedEnd']),
      actualStart: serializer.fromJson<DateTime?>(json['actualStart']),
      actualEnd: serializer.fromJson<DateTime?>(json['actualEnd']),
      status: serializer.fromJson<String>(json['status']),
      percentComplete: serializer.fromJson<double>(json['percentComplete']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'wbsNodeId': serializer.toJson<int>(wbsNodeId),
      'name': serializer.toJson<String>(name),
      'assignedTo': serializer.toJson<int?>(assignedTo),
      'estimatedDurationDays': serializer.toJson<int>(estimatedDurationDays),
      'plannedStart': serializer.toJson<DateTime>(plannedStart),
      'plannedEnd': serializer.toJson<DateTime>(plannedEnd),
      'actualStart': serializer.toJson<DateTime?>(actualStart),
      'actualEnd': serializer.toJson<DateTime?>(actualEnd),
      'status': serializer.toJson<String>(status),
      'percentComplete': serializer.toJson<double>(percentComplete),
    };
  }

  Activity copyWith({
    int? id,
    int? wbsNodeId,
    String? name,
    Value<int?> assignedTo = const Value.absent(),
    int? estimatedDurationDays,
    DateTime? plannedStart,
    DateTime? plannedEnd,
    Value<DateTime?> actualStart = const Value.absent(),
    Value<DateTime?> actualEnd = const Value.absent(),
    String? status,
    double? percentComplete,
  }) => Activity(
    id: id ?? this.id,
    wbsNodeId: wbsNodeId ?? this.wbsNodeId,
    name: name ?? this.name,
    assignedTo: assignedTo.present ? assignedTo.value : this.assignedTo,
    estimatedDurationDays: estimatedDurationDays ?? this.estimatedDurationDays,
    plannedStart: plannedStart ?? this.plannedStart,
    plannedEnd: plannedEnd ?? this.plannedEnd,
    actualStart: actualStart.present ? actualStart.value : this.actualStart,
    actualEnd: actualEnd.present ? actualEnd.value : this.actualEnd,
    status: status ?? this.status,
    percentComplete: percentComplete ?? this.percentComplete,
  );
  Activity copyWithCompanion(ActivitiesCompanion data) {
    return Activity(
      id: data.id.present ? data.id.value : this.id,
      wbsNodeId: data.wbsNodeId.present ? data.wbsNodeId.value : this.wbsNodeId,
      name: data.name.present ? data.name.value : this.name,
      assignedTo: data.assignedTo.present
          ? data.assignedTo.value
          : this.assignedTo,
      estimatedDurationDays: data.estimatedDurationDays.present
          ? data.estimatedDurationDays.value
          : this.estimatedDurationDays,
      plannedStart: data.plannedStart.present
          ? data.plannedStart.value
          : this.plannedStart,
      plannedEnd: data.plannedEnd.present
          ? data.plannedEnd.value
          : this.plannedEnd,
      actualStart: data.actualStart.present
          ? data.actualStart.value
          : this.actualStart,
      actualEnd: data.actualEnd.present ? data.actualEnd.value : this.actualEnd,
      status: data.status.present ? data.status.value : this.status,
      percentComplete: data.percentComplete.present
          ? data.percentComplete.value
          : this.percentComplete,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Activity(')
          ..write('id: $id, ')
          ..write('wbsNodeId: $wbsNodeId, ')
          ..write('name: $name, ')
          ..write('assignedTo: $assignedTo, ')
          ..write('estimatedDurationDays: $estimatedDurationDays, ')
          ..write('plannedStart: $plannedStart, ')
          ..write('plannedEnd: $plannedEnd, ')
          ..write('actualStart: $actualStart, ')
          ..write('actualEnd: $actualEnd, ')
          ..write('status: $status, ')
          ..write('percentComplete: $percentComplete')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    wbsNodeId,
    name,
    assignedTo,
    estimatedDurationDays,
    plannedStart,
    plannedEnd,
    actualStart,
    actualEnd,
    status,
    percentComplete,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Activity &&
          other.id == this.id &&
          other.wbsNodeId == this.wbsNodeId &&
          other.name == this.name &&
          other.assignedTo == this.assignedTo &&
          other.estimatedDurationDays == this.estimatedDurationDays &&
          other.plannedStart == this.plannedStart &&
          other.plannedEnd == this.plannedEnd &&
          other.actualStart == this.actualStart &&
          other.actualEnd == this.actualEnd &&
          other.status == this.status &&
          other.percentComplete == this.percentComplete);
}

class ActivitiesCompanion extends UpdateCompanion<Activity> {
  final Value<int> id;
  final Value<int> wbsNodeId;
  final Value<String> name;
  final Value<int?> assignedTo;
  final Value<int> estimatedDurationDays;
  final Value<DateTime> plannedStart;
  final Value<DateTime> plannedEnd;
  final Value<DateTime?> actualStart;
  final Value<DateTime?> actualEnd;
  final Value<String> status;
  final Value<double> percentComplete;
  const ActivitiesCompanion({
    this.id = const Value.absent(),
    this.wbsNodeId = const Value.absent(),
    this.name = const Value.absent(),
    this.assignedTo = const Value.absent(),
    this.estimatedDurationDays = const Value.absent(),
    this.plannedStart = const Value.absent(),
    this.plannedEnd = const Value.absent(),
    this.actualStart = const Value.absent(),
    this.actualEnd = const Value.absent(),
    this.status = const Value.absent(),
    this.percentComplete = const Value.absent(),
  });
  ActivitiesCompanion.insert({
    this.id = const Value.absent(),
    required int wbsNodeId,
    required String name,
    this.assignedTo = const Value.absent(),
    required int estimatedDurationDays,
    required DateTime plannedStart,
    required DateTime plannedEnd,
    this.actualStart = const Value.absent(),
    this.actualEnd = const Value.absent(),
    required String status,
    required double percentComplete,
  }) : wbsNodeId = Value(wbsNodeId),
       name = Value(name),
       estimatedDurationDays = Value(estimatedDurationDays),
       plannedStart = Value(plannedStart),
       plannedEnd = Value(plannedEnd),
       status = Value(status),
       percentComplete = Value(percentComplete);
  static Insertable<Activity> custom({
    Expression<int>? id,
    Expression<int>? wbsNodeId,
    Expression<String>? name,
    Expression<int>? assignedTo,
    Expression<int>? estimatedDurationDays,
    Expression<DateTime>? plannedStart,
    Expression<DateTime>? plannedEnd,
    Expression<DateTime>? actualStart,
    Expression<DateTime>? actualEnd,
    Expression<String>? status,
    Expression<double>? percentComplete,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (wbsNodeId != null) 'wbs_node_id': wbsNodeId,
      if (name != null) 'name': name,
      if (assignedTo != null) 'assigned_to': assignedTo,
      if (estimatedDurationDays != null)
        'estimated_duration_days': estimatedDurationDays,
      if (plannedStart != null) 'planned_start': plannedStart,
      if (plannedEnd != null) 'planned_end': plannedEnd,
      if (actualStart != null) 'actual_start': actualStart,
      if (actualEnd != null) 'actual_end': actualEnd,
      if (status != null) 'status': status,
      if (percentComplete != null) 'percent_complete': percentComplete,
    });
  }

  ActivitiesCompanion copyWith({
    Value<int>? id,
    Value<int>? wbsNodeId,
    Value<String>? name,
    Value<int?>? assignedTo,
    Value<int>? estimatedDurationDays,
    Value<DateTime>? plannedStart,
    Value<DateTime>? plannedEnd,
    Value<DateTime?>? actualStart,
    Value<DateTime?>? actualEnd,
    Value<String>? status,
    Value<double>? percentComplete,
  }) {
    return ActivitiesCompanion(
      id: id ?? this.id,
      wbsNodeId: wbsNodeId ?? this.wbsNodeId,
      name: name ?? this.name,
      assignedTo: assignedTo ?? this.assignedTo,
      estimatedDurationDays:
          estimatedDurationDays ?? this.estimatedDurationDays,
      plannedStart: plannedStart ?? this.plannedStart,
      plannedEnd: plannedEnd ?? this.plannedEnd,
      actualStart: actualStart ?? this.actualStart,
      actualEnd: actualEnd ?? this.actualEnd,
      status: status ?? this.status,
      percentComplete: percentComplete ?? this.percentComplete,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (wbsNodeId.present) {
      map['wbs_node_id'] = Variable<int>(wbsNodeId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (assignedTo.present) {
      map['assigned_to'] = Variable<int>(assignedTo.value);
    }
    if (estimatedDurationDays.present) {
      map['estimated_duration_days'] = Variable<int>(
        estimatedDurationDays.value,
      );
    }
    if (plannedStart.present) {
      map['planned_start'] = Variable<DateTime>(plannedStart.value);
    }
    if (plannedEnd.present) {
      map['planned_end'] = Variable<DateTime>(plannedEnd.value);
    }
    if (actualStart.present) {
      map['actual_start'] = Variable<DateTime>(actualStart.value);
    }
    if (actualEnd.present) {
      map['actual_end'] = Variable<DateTime>(actualEnd.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (percentComplete.present) {
      map['percent_complete'] = Variable<double>(percentComplete.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActivitiesCompanion(')
          ..write('id: $id, ')
          ..write('wbsNodeId: $wbsNodeId, ')
          ..write('name: $name, ')
          ..write('assignedTo: $assignedTo, ')
          ..write('estimatedDurationDays: $estimatedDurationDays, ')
          ..write('plannedStart: $plannedStart, ')
          ..write('plannedEnd: $plannedEnd, ')
          ..write('actualStart: $actualStart, ')
          ..write('actualEnd: $actualEnd, ')
          ..write('status: $status, ')
          ..write('percentComplete: $percentComplete')
          ..write(')'))
        .toString();
  }
}

class $ActivityDependenciesTable extends ActivityDependencies
    with TableInfo<$ActivityDependenciesTable, ActivityDependency> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActivityDependenciesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _predecessorIdMeta = const VerificationMeta(
    'predecessorId',
  );
  @override
  late final GeneratedColumn<int> predecessorId = GeneratedColumn<int>(
    'predecessor_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _successorIdMeta = const VerificationMeta(
    'successorId',
  );
  @override
  late final GeneratedColumn<int> successorId = GeneratedColumn<int>(
    'successor_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dependencyTypeMeta = const VerificationMeta(
    'dependencyType',
  );
  @override
  late final GeneratedColumn<String> dependencyType = GeneratedColumn<String>(
    'dependency_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    predecessorId,
    successorId,
    dependencyType,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'activity_dependencies';
  @override
  VerificationContext validateIntegrity(
    Insertable<ActivityDependency> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('predecessor_id')) {
      context.handle(
        _predecessorIdMeta,
        predecessorId.isAcceptableOrUnknown(
          data['predecessor_id']!,
          _predecessorIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_predecessorIdMeta);
    }
    if (data.containsKey('successor_id')) {
      context.handle(
        _successorIdMeta,
        successorId.isAcceptableOrUnknown(
          data['successor_id']!,
          _successorIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_successorIdMeta);
    }
    if (data.containsKey('dependency_type')) {
      context.handle(
        _dependencyTypeMeta,
        dependencyType.isAcceptableOrUnknown(
          data['dependency_type']!,
          _dependencyTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dependencyTypeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActivityDependency map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActivityDependency(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      predecessorId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}predecessor_id'],
      )!,
      successorId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}successor_id'],
      )!,
      dependencyType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dependency_type'],
      )!,
    );
  }

  @override
  $ActivityDependenciesTable createAlias(String alias) {
    return $ActivityDependenciesTable(attachedDatabase, alias);
  }
}

class ActivityDependency extends DataClass
    implements Insertable<ActivityDependency> {
  final int id;
  final int predecessorId;
  final int successorId;
  final String dependencyType;
  const ActivityDependency({
    required this.id,
    required this.predecessorId,
    required this.successorId,
    required this.dependencyType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['predecessor_id'] = Variable<int>(predecessorId);
    map['successor_id'] = Variable<int>(successorId);
    map['dependency_type'] = Variable<String>(dependencyType);
    return map;
  }

  ActivityDependenciesCompanion toCompanion(bool nullToAbsent) {
    return ActivityDependenciesCompanion(
      id: Value(id),
      predecessorId: Value(predecessorId),
      successorId: Value(successorId),
      dependencyType: Value(dependencyType),
    );
  }

  factory ActivityDependency.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActivityDependency(
      id: serializer.fromJson<int>(json['id']),
      predecessorId: serializer.fromJson<int>(json['predecessorId']),
      successorId: serializer.fromJson<int>(json['successorId']),
      dependencyType: serializer.fromJson<String>(json['dependencyType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'predecessorId': serializer.toJson<int>(predecessorId),
      'successorId': serializer.toJson<int>(successorId),
      'dependencyType': serializer.toJson<String>(dependencyType),
    };
  }

  ActivityDependency copyWith({
    int? id,
    int? predecessorId,
    int? successorId,
    String? dependencyType,
  }) => ActivityDependency(
    id: id ?? this.id,
    predecessorId: predecessorId ?? this.predecessorId,
    successorId: successorId ?? this.successorId,
    dependencyType: dependencyType ?? this.dependencyType,
  );
  ActivityDependency copyWithCompanion(ActivityDependenciesCompanion data) {
    return ActivityDependency(
      id: data.id.present ? data.id.value : this.id,
      predecessorId: data.predecessorId.present
          ? data.predecessorId.value
          : this.predecessorId,
      successorId: data.successorId.present
          ? data.successorId.value
          : this.successorId,
      dependencyType: data.dependencyType.present
          ? data.dependencyType.value
          : this.dependencyType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActivityDependency(')
          ..write('id: $id, ')
          ..write('predecessorId: $predecessorId, ')
          ..write('successorId: $successorId, ')
          ..write('dependencyType: $dependencyType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, predecessorId, successorId, dependencyType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActivityDependency &&
          other.id == this.id &&
          other.predecessorId == this.predecessorId &&
          other.successorId == this.successorId &&
          other.dependencyType == this.dependencyType);
}

class ActivityDependenciesCompanion
    extends UpdateCompanion<ActivityDependency> {
  final Value<int> id;
  final Value<int> predecessorId;
  final Value<int> successorId;
  final Value<String> dependencyType;
  const ActivityDependenciesCompanion({
    this.id = const Value.absent(),
    this.predecessorId = const Value.absent(),
    this.successorId = const Value.absent(),
    this.dependencyType = const Value.absent(),
  });
  ActivityDependenciesCompanion.insert({
    this.id = const Value.absent(),
    required int predecessorId,
    required int successorId,
    required String dependencyType,
  }) : predecessorId = Value(predecessorId),
       successorId = Value(successorId),
       dependencyType = Value(dependencyType);
  static Insertable<ActivityDependency> custom({
    Expression<int>? id,
    Expression<int>? predecessorId,
    Expression<int>? successorId,
    Expression<String>? dependencyType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (predecessorId != null) 'predecessor_id': predecessorId,
      if (successorId != null) 'successor_id': successorId,
      if (dependencyType != null) 'dependency_type': dependencyType,
    });
  }

  ActivityDependenciesCompanion copyWith({
    Value<int>? id,
    Value<int>? predecessorId,
    Value<int>? successorId,
    Value<String>? dependencyType,
  }) {
    return ActivityDependenciesCompanion(
      id: id ?? this.id,
      predecessorId: predecessorId ?? this.predecessorId,
      successorId: successorId ?? this.successorId,
      dependencyType: dependencyType ?? this.dependencyType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (predecessorId.present) {
      map['predecessor_id'] = Variable<int>(predecessorId.value);
    }
    if (successorId.present) {
      map['successor_id'] = Variable<int>(successorId.value);
    }
    if (dependencyType.present) {
      map['dependency_type'] = Variable<String>(dependencyType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActivityDependenciesCompanion(')
          ..write('id: $id, ')
          ..write('predecessorId: $predecessorId, ')
          ..write('successorId: $successorId, ')
          ..write('dependencyType: $dependencyType')
          ..write(')'))
        .toString();
  }
}

class $TeamMembersTable extends TeamMembers
    with TableInfo<$TeamMembersTable, TeamMember> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TeamMembersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dailyRateMeta = const VerificationMeta(
    'dailyRate',
  );
  @override
  late final GeneratedColumn<double> dailyRate = GeneratedColumn<double>(
    'daily_rate',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, role, dailyRate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'team_members';
  @override
  VerificationContext validateIntegrity(
    Insertable<TeamMember> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('daily_rate')) {
      context.handle(
        _dailyRateMeta,
        dailyRate.isAcceptableOrUnknown(data['daily_rate']!, _dailyRateMeta),
      );
    } else if (isInserting) {
      context.missing(_dailyRateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TeamMember map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TeamMember(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      dailyRate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}daily_rate'],
      )!,
    );
  }

  @override
  $TeamMembersTable createAlias(String alias) {
    return $TeamMembersTable(attachedDatabase, alias);
  }
}

class TeamMember extends DataClass implements Insertable<TeamMember> {
  final int id;
  final String name;
  final String role;
  final double dailyRate;
  const TeamMember({
    required this.id,
    required this.name,
    required this.role,
    required this.dailyRate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['role'] = Variable<String>(role);
    map['daily_rate'] = Variable<double>(dailyRate);
    return map;
  }

  TeamMembersCompanion toCompanion(bool nullToAbsent) {
    return TeamMembersCompanion(
      id: Value(id),
      name: Value(name),
      role: Value(role),
      dailyRate: Value(dailyRate),
    );
  }

  factory TeamMember.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TeamMember(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      role: serializer.fromJson<String>(json['role']),
      dailyRate: serializer.fromJson<double>(json['dailyRate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'role': serializer.toJson<String>(role),
      'dailyRate': serializer.toJson<double>(dailyRate),
    };
  }

  TeamMember copyWith({
    int? id,
    String? name,
    String? role,
    double? dailyRate,
  }) => TeamMember(
    id: id ?? this.id,
    name: name ?? this.name,
    role: role ?? this.role,
    dailyRate: dailyRate ?? this.dailyRate,
  );
  TeamMember copyWithCompanion(TeamMembersCompanion data) {
    return TeamMember(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      role: data.role.present ? data.role.value : this.role,
      dailyRate: data.dailyRate.present ? data.dailyRate.value : this.dailyRate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TeamMember(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('role: $role, ')
          ..write('dailyRate: $dailyRate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, role, dailyRate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TeamMember &&
          other.id == this.id &&
          other.name == this.name &&
          other.role == this.role &&
          other.dailyRate == this.dailyRate);
}

class TeamMembersCompanion extends UpdateCompanion<TeamMember> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> role;
  final Value<double> dailyRate;
  const TeamMembersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.role = const Value.absent(),
    this.dailyRate = const Value.absent(),
  });
  TeamMembersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String role,
    required double dailyRate,
  }) : name = Value(name),
       role = Value(role),
       dailyRate = Value(dailyRate);
  static Insertable<TeamMember> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? role,
    Expression<double>? dailyRate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (role != null) 'role': role,
      if (dailyRate != null) 'daily_rate': dailyRate,
    });
  }

  TeamMembersCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? role,
    Value<double>? dailyRate,
  }) {
    return TeamMembersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      role: role ?? this.role,
      dailyRate: dailyRate ?? this.dailyRate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (dailyRate.present) {
      map['daily_rate'] = Variable<double>(dailyRate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TeamMembersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('role: $role, ')
          ..write('dailyRate: $dailyRate')
          ..write(')'))
        .toString();
  }
}

class $ActivityCostsTable extends ActivityCosts
    with TableInfo<$ActivityCostsTable, ActivityCost> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActivityCostsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _activityIdMeta = const VerificationMeta(
    'activityId',
  );
  @override
  late final GeneratedColumn<int> activityId = GeneratedColumn<int>(
    'activity_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _plannedCostMeta = const VerificationMeta(
    'plannedCost',
  );
  @override
  late final GeneratedColumn<double> plannedCost = GeneratedColumn<double>(
    'planned_cost',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actualCostMeta = const VerificationMeta(
    'actualCost',
  );
  @override
  late final GeneratedColumn<double> actualCost = GeneratedColumn<double>(
    'actual_cost',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recordedAtMeta = const VerificationMeta(
    'recordedAt',
  );
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
    'recorded_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    activityId,
    plannedCost,
    actualCost,
    recordedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'activity_costs';
  @override
  VerificationContext validateIntegrity(
    Insertable<ActivityCost> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('activity_id')) {
      context.handle(
        _activityIdMeta,
        activityId.isAcceptableOrUnknown(data['activity_id']!, _activityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_activityIdMeta);
    }
    if (data.containsKey('planned_cost')) {
      context.handle(
        _plannedCostMeta,
        plannedCost.isAcceptableOrUnknown(
          data['planned_cost']!,
          _plannedCostMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_plannedCostMeta);
    }
    if (data.containsKey('actual_cost')) {
      context.handle(
        _actualCostMeta,
        actualCost.isAcceptableOrUnknown(data['actual_cost']!, _actualCostMeta),
      );
    } else if (isInserting) {
      context.missing(_actualCostMeta);
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
        _recordedAtMeta,
        recordedAt.isAcceptableOrUnknown(data['recorded_at']!, _recordedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_recordedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActivityCost map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActivityCost(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      activityId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}activity_id'],
      )!,
      plannedCost: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}planned_cost'],
      )!,
      actualCost: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}actual_cost'],
      )!,
      recordedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}recorded_at'],
      )!,
    );
  }

  @override
  $ActivityCostsTable createAlias(String alias) {
    return $ActivityCostsTable(attachedDatabase, alias);
  }
}

class ActivityCost extends DataClass implements Insertable<ActivityCost> {
  final int id;
  final int activityId;
  final double plannedCost;
  final double actualCost;
  final DateTime recordedAt;
  const ActivityCost({
    required this.id,
    required this.activityId,
    required this.plannedCost,
    required this.actualCost,
    required this.recordedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['activity_id'] = Variable<int>(activityId);
    map['planned_cost'] = Variable<double>(plannedCost);
    map['actual_cost'] = Variable<double>(actualCost);
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    return map;
  }

  ActivityCostsCompanion toCompanion(bool nullToAbsent) {
    return ActivityCostsCompanion(
      id: Value(id),
      activityId: Value(activityId),
      plannedCost: Value(plannedCost),
      actualCost: Value(actualCost),
      recordedAt: Value(recordedAt),
    );
  }

  factory ActivityCost.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActivityCost(
      id: serializer.fromJson<int>(json['id']),
      activityId: serializer.fromJson<int>(json['activityId']),
      plannedCost: serializer.fromJson<double>(json['plannedCost']),
      actualCost: serializer.fromJson<double>(json['actualCost']),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'activityId': serializer.toJson<int>(activityId),
      'plannedCost': serializer.toJson<double>(plannedCost),
      'actualCost': serializer.toJson<double>(actualCost),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
    };
  }

  ActivityCost copyWith({
    int? id,
    int? activityId,
    double? plannedCost,
    double? actualCost,
    DateTime? recordedAt,
  }) => ActivityCost(
    id: id ?? this.id,
    activityId: activityId ?? this.activityId,
    plannedCost: plannedCost ?? this.plannedCost,
    actualCost: actualCost ?? this.actualCost,
    recordedAt: recordedAt ?? this.recordedAt,
  );
  ActivityCost copyWithCompanion(ActivityCostsCompanion data) {
    return ActivityCost(
      id: data.id.present ? data.id.value : this.id,
      activityId: data.activityId.present
          ? data.activityId.value
          : this.activityId,
      plannedCost: data.plannedCost.present
          ? data.plannedCost.value
          : this.plannedCost,
      actualCost: data.actualCost.present
          ? data.actualCost.value
          : this.actualCost,
      recordedAt: data.recordedAt.present
          ? data.recordedAt.value
          : this.recordedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActivityCost(')
          ..write('id: $id, ')
          ..write('activityId: $activityId, ')
          ..write('plannedCost: $plannedCost, ')
          ..write('actualCost: $actualCost, ')
          ..write('recordedAt: $recordedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, activityId, plannedCost, actualCost, recordedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActivityCost &&
          other.id == this.id &&
          other.activityId == this.activityId &&
          other.plannedCost == this.plannedCost &&
          other.actualCost == this.actualCost &&
          other.recordedAt == this.recordedAt);
}

class ActivityCostsCompanion extends UpdateCompanion<ActivityCost> {
  final Value<int> id;
  final Value<int> activityId;
  final Value<double> plannedCost;
  final Value<double> actualCost;
  final Value<DateTime> recordedAt;
  const ActivityCostsCompanion({
    this.id = const Value.absent(),
    this.activityId = const Value.absent(),
    this.plannedCost = const Value.absent(),
    this.actualCost = const Value.absent(),
    this.recordedAt = const Value.absent(),
  });
  ActivityCostsCompanion.insert({
    this.id = const Value.absent(),
    required int activityId,
    required double plannedCost,
    required double actualCost,
    required DateTime recordedAt,
  }) : activityId = Value(activityId),
       plannedCost = Value(plannedCost),
       actualCost = Value(actualCost),
       recordedAt = Value(recordedAt);
  static Insertable<ActivityCost> custom({
    Expression<int>? id,
    Expression<int>? activityId,
    Expression<double>? plannedCost,
    Expression<double>? actualCost,
    Expression<DateTime>? recordedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (activityId != null) 'activity_id': activityId,
      if (plannedCost != null) 'planned_cost': plannedCost,
      if (actualCost != null) 'actual_cost': actualCost,
      if (recordedAt != null) 'recorded_at': recordedAt,
    });
  }

  ActivityCostsCompanion copyWith({
    Value<int>? id,
    Value<int>? activityId,
    Value<double>? plannedCost,
    Value<double>? actualCost,
    Value<DateTime>? recordedAt,
  }) {
    return ActivityCostsCompanion(
      id: id ?? this.id,
      activityId: activityId ?? this.activityId,
      plannedCost: plannedCost ?? this.plannedCost,
      actualCost: actualCost ?? this.actualCost,
      recordedAt: recordedAt ?? this.recordedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (activityId.present) {
      map['activity_id'] = Variable<int>(activityId.value);
    }
    if (plannedCost.present) {
      map['planned_cost'] = Variable<double>(plannedCost.value);
    }
    if (actualCost.present) {
      map['actual_cost'] = Variable<double>(actualCost.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActivityCostsCompanion(')
          ..write('id: $id, ')
          ..write('activityId: $activityId, ')
          ..write('plannedCost: $plannedCost, ')
          ..write('actualCost: $actualCost, ')
          ..write('recordedAt: $recordedAt')
          ..write(')'))
        .toString();
  }
}

class $EvmSnapshotsTable extends EvmSnapshots
    with TableInfo<$EvmSnapshotsTable, EvmSnapshot> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EvmSnapshotsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _snapshotDateMeta = const VerificationMeta(
    'snapshotDate',
  );
  @override
  late final GeneratedColumn<DateTime> snapshotDate = GeneratedColumn<DateTime>(
    'snapshot_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pvMeta = const VerificationMeta('pv');
  @override
  late final GeneratedColumn<double> pv = GeneratedColumn<double>(
    'pv',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _evMeta = const VerificationMeta('ev');
  @override
  late final GeneratedColumn<double> ev = GeneratedColumn<double>(
    'ev',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _acMeta = const VerificationMeta('ac');
  @override
  late final GeneratedColumn<double> ac = GeneratedColumn<double>(
    'ac',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cpiMeta = const VerificationMeta('cpi');
  @override
  late final GeneratedColumn<double> cpi = GeneratedColumn<double>(
    'cpi',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _spiMeta = const VerificationMeta('spi');
  @override
  late final GeneratedColumn<double> spi = GeneratedColumn<double>(
    'spi',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    snapshotDate,
    pv,
    ev,
    ac,
    cpi,
    spi,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'evm_snapshots';
  @override
  VerificationContext validateIntegrity(
    Insertable<EvmSnapshot> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('snapshot_date')) {
      context.handle(
        _snapshotDateMeta,
        snapshotDate.isAcceptableOrUnknown(
          data['snapshot_date']!,
          _snapshotDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_snapshotDateMeta);
    }
    if (data.containsKey('pv')) {
      context.handle(_pvMeta, pv.isAcceptableOrUnknown(data['pv']!, _pvMeta));
    } else if (isInserting) {
      context.missing(_pvMeta);
    }
    if (data.containsKey('ev')) {
      context.handle(_evMeta, ev.isAcceptableOrUnknown(data['ev']!, _evMeta));
    } else if (isInserting) {
      context.missing(_evMeta);
    }
    if (data.containsKey('ac')) {
      context.handle(_acMeta, ac.isAcceptableOrUnknown(data['ac']!, _acMeta));
    } else if (isInserting) {
      context.missing(_acMeta);
    }
    if (data.containsKey('cpi')) {
      context.handle(
        _cpiMeta,
        cpi.isAcceptableOrUnknown(data['cpi']!, _cpiMeta),
      );
    } else if (isInserting) {
      context.missing(_cpiMeta);
    }
    if (data.containsKey('spi')) {
      context.handle(
        _spiMeta,
        spi.isAcceptableOrUnknown(data['spi']!, _spiMeta),
      );
    } else if (isInserting) {
      context.missing(_spiMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EvmSnapshot map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EvmSnapshot(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      snapshotDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}snapshot_date'],
      )!,
      pv: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}pv'],
      )!,
      ev: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}ev'],
      )!,
      ac: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}ac'],
      )!,
      cpi: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cpi'],
      )!,
      spi: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}spi'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $EvmSnapshotsTable createAlias(String alias) {
    return $EvmSnapshotsTable(attachedDatabase, alias);
  }
}

class EvmSnapshot extends DataClass implements Insertable<EvmSnapshot> {
  final int id;
  final DateTime snapshotDate;
  final double pv;
  final double ev;
  final double ac;
  final double cpi;
  final double spi;
  final String? note;
  const EvmSnapshot({
    required this.id,
    required this.snapshotDate,
    required this.pv,
    required this.ev,
    required this.ac,
    required this.cpi,
    required this.spi,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['snapshot_date'] = Variable<DateTime>(snapshotDate);
    map['pv'] = Variable<double>(pv);
    map['ev'] = Variable<double>(ev);
    map['ac'] = Variable<double>(ac);
    map['cpi'] = Variable<double>(cpi);
    map['spi'] = Variable<double>(spi);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  EvmSnapshotsCompanion toCompanion(bool nullToAbsent) {
    return EvmSnapshotsCompanion(
      id: Value(id),
      snapshotDate: Value(snapshotDate),
      pv: Value(pv),
      ev: Value(ev),
      ac: Value(ac),
      cpi: Value(cpi),
      spi: Value(spi),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory EvmSnapshot.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EvmSnapshot(
      id: serializer.fromJson<int>(json['id']),
      snapshotDate: serializer.fromJson<DateTime>(json['snapshotDate']),
      pv: serializer.fromJson<double>(json['pv']),
      ev: serializer.fromJson<double>(json['ev']),
      ac: serializer.fromJson<double>(json['ac']),
      cpi: serializer.fromJson<double>(json['cpi']),
      spi: serializer.fromJson<double>(json['spi']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'snapshotDate': serializer.toJson<DateTime>(snapshotDate),
      'pv': serializer.toJson<double>(pv),
      'ev': serializer.toJson<double>(ev),
      'ac': serializer.toJson<double>(ac),
      'cpi': serializer.toJson<double>(cpi),
      'spi': serializer.toJson<double>(spi),
      'note': serializer.toJson<String?>(note),
    };
  }

  EvmSnapshot copyWith({
    int? id,
    DateTime? snapshotDate,
    double? pv,
    double? ev,
    double? ac,
    double? cpi,
    double? spi,
    Value<String?> note = const Value.absent(),
  }) => EvmSnapshot(
    id: id ?? this.id,
    snapshotDate: snapshotDate ?? this.snapshotDate,
    pv: pv ?? this.pv,
    ev: ev ?? this.ev,
    ac: ac ?? this.ac,
    cpi: cpi ?? this.cpi,
    spi: spi ?? this.spi,
    note: note.present ? note.value : this.note,
  );
  EvmSnapshot copyWithCompanion(EvmSnapshotsCompanion data) {
    return EvmSnapshot(
      id: data.id.present ? data.id.value : this.id,
      snapshotDate: data.snapshotDate.present
          ? data.snapshotDate.value
          : this.snapshotDate,
      pv: data.pv.present ? data.pv.value : this.pv,
      ev: data.ev.present ? data.ev.value : this.ev,
      ac: data.ac.present ? data.ac.value : this.ac,
      cpi: data.cpi.present ? data.cpi.value : this.cpi,
      spi: data.spi.present ? data.spi.value : this.spi,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EvmSnapshot(')
          ..write('id: $id, ')
          ..write('snapshotDate: $snapshotDate, ')
          ..write('pv: $pv, ')
          ..write('ev: $ev, ')
          ..write('ac: $ac, ')
          ..write('cpi: $cpi, ')
          ..write('spi: $spi, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, snapshotDate, pv, ev, ac, cpi, spi, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EvmSnapshot &&
          other.id == this.id &&
          other.snapshotDate == this.snapshotDate &&
          other.pv == this.pv &&
          other.ev == this.ev &&
          other.ac == this.ac &&
          other.cpi == this.cpi &&
          other.spi == this.spi &&
          other.note == this.note);
}

class EvmSnapshotsCompanion extends UpdateCompanion<EvmSnapshot> {
  final Value<int> id;
  final Value<DateTime> snapshotDate;
  final Value<double> pv;
  final Value<double> ev;
  final Value<double> ac;
  final Value<double> cpi;
  final Value<double> spi;
  final Value<String?> note;
  const EvmSnapshotsCompanion({
    this.id = const Value.absent(),
    this.snapshotDate = const Value.absent(),
    this.pv = const Value.absent(),
    this.ev = const Value.absent(),
    this.ac = const Value.absent(),
    this.cpi = const Value.absent(),
    this.spi = const Value.absent(),
    this.note = const Value.absent(),
  });
  EvmSnapshotsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime snapshotDate,
    required double pv,
    required double ev,
    required double ac,
    required double cpi,
    required double spi,
    this.note = const Value.absent(),
  }) : snapshotDate = Value(snapshotDate),
       pv = Value(pv),
       ev = Value(ev),
       ac = Value(ac),
       cpi = Value(cpi),
       spi = Value(spi);
  static Insertable<EvmSnapshot> custom({
    Expression<int>? id,
    Expression<DateTime>? snapshotDate,
    Expression<double>? pv,
    Expression<double>? ev,
    Expression<double>? ac,
    Expression<double>? cpi,
    Expression<double>? spi,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (snapshotDate != null) 'snapshot_date': snapshotDate,
      if (pv != null) 'pv': pv,
      if (ev != null) 'ev': ev,
      if (ac != null) 'ac': ac,
      if (cpi != null) 'cpi': cpi,
      if (spi != null) 'spi': spi,
      if (note != null) 'note': note,
    });
  }

  EvmSnapshotsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? snapshotDate,
    Value<double>? pv,
    Value<double>? ev,
    Value<double>? ac,
    Value<double>? cpi,
    Value<double>? spi,
    Value<String?>? note,
  }) {
    return EvmSnapshotsCompanion(
      id: id ?? this.id,
      snapshotDate: snapshotDate ?? this.snapshotDate,
      pv: pv ?? this.pv,
      ev: ev ?? this.ev,
      ac: ac ?? this.ac,
      cpi: cpi ?? this.cpi,
      spi: spi ?? this.spi,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (snapshotDate.present) {
      map['snapshot_date'] = Variable<DateTime>(snapshotDate.value);
    }
    if (pv.present) {
      map['pv'] = Variable<double>(pv.value);
    }
    if (ev.present) {
      map['ev'] = Variable<double>(ev.value);
    }
    if (ac.present) {
      map['ac'] = Variable<double>(ac.value);
    }
    if (cpi.present) {
      map['cpi'] = Variable<double>(cpi.value);
    }
    if (spi.present) {
      map['spi'] = Variable<double>(spi.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EvmSnapshotsCompanion(')
          ..write('id: $id, ')
          ..write('snapshotDate: $snapshotDate, ')
          ..write('pv: $pv, ')
          ..write('ev: $ev, ')
          ..write('ac: $ac, ')
          ..write('cpi: $cpi, ')
          ..write('spi: $spi, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $DefectsTable extends Defects with TableInfo<$DefectsTable, Defect> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DefectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _activityIdMeta = const VerificationMeta(
    'activityId',
  );
  @override
  late final GeneratedColumn<int> activityId = GeneratedColumn<int>(
    'activity_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _moduleNameMeta = const VerificationMeta(
    'moduleName',
  );
  @override
  late final GeneratedColumn<String> moduleName = GeneratedColumn<String>(
    'module_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _severityMeta = const VerificationMeta(
    'severity',
  );
  @override
  late final GeneratedColumn<String> severity = GeneratedColumn<String>(
    'severity',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _assignedToMeta = const VerificationMeta(
    'assignedTo',
  );
  @override
  late final GeneratedColumn<int> assignedTo = GeneratedColumn<int>(
    'assigned_to',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reportedAtMeta = const VerificationMeta(
    'reportedAt',
  );
  @override
  late final GeneratedColumn<DateTime> reportedAt = GeneratedColumn<DateTime>(
    'reported_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _resolvedAtMeta = const VerificationMeta(
    'resolvedAt',
  );
  @override
  late final GeneratedColumn<DateTime> resolvedAt = GeneratedColumn<DateTime>(
    'resolved_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    activityId,
    moduleName,
    description,
    severity,
    assignedTo,
    status,
    reportedAt,
    resolvedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'defects';
  @override
  VerificationContext validateIntegrity(
    Insertable<Defect> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('activity_id')) {
      context.handle(
        _activityIdMeta,
        activityId.isAcceptableOrUnknown(data['activity_id']!, _activityIdMeta),
      );
    }
    if (data.containsKey('module_name')) {
      context.handle(
        _moduleNameMeta,
        moduleName.isAcceptableOrUnknown(data['module_name']!, _moduleNameMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('severity')) {
      context.handle(
        _severityMeta,
        severity.isAcceptableOrUnknown(data['severity']!, _severityMeta),
      );
    } else if (isInserting) {
      context.missing(_severityMeta);
    }
    if (data.containsKey('assigned_to')) {
      context.handle(
        _assignedToMeta,
        assignedTo.isAcceptableOrUnknown(data['assigned_to']!, _assignedToMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('reported_at')) {
      context.handle(
        _reportedAtMeta,
        reportedAt.isAcceptableOrUnknown(data['reported_at']!, _reportedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_reportedAtMeta);
    }
    if (data.containsKey('resolved_at')) {
      context.handle(
        _resolvedAtMeta,
        resolvedAt.isAcceptableOrUnknown(data['resolved_at']!, _resolvedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Defect map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Defect(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      activityId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}activity_id'],
      ),
      moduleName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}module_name'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      severity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}severity'],
      )!,
      assignedTo: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}assigned_to'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      reportedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}reported_at'],
      )!,
      resolvedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}resolved_at'],
      ),
    );
  }

  @override
  $DefectsTable createAlias(String alias) {
    return $DefectsTable(attachedDatabase, alias);
  }
}

class Defect extends DataClass implements Insertable<Defect> {
  final int id;
  final int? activityId;
  final String? moduleName;
  final String description;
  final String severity;
  final int? assignedTo;
  final String status;
  final DateTime reportedAt;
  final DateTime? resolvedAt;
  const Defect({
    required this.id,
    this.activityId,
    this.moduleName,
    required this.description,
    required this.severity,
    this.assignedTo,
    required this.status,
    required this.reportedAt,
    this.resolvedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || activityId != null) {
      map['activity_id'] = Variable<int>(activityId);
    }
    if (!nullToAbsent || moduleName != null) {
      map['module_name'] = Variable<String>(moduleName);
    }
    map['description'] = Variable<String>(description);
    map['severity'] = Variable<String>(severity);
    if (!nullToAbsent || assignedTo != null) {
      map['assigned_to'] = Variable<int>(assignedTo);
    }
    map['status'] = Variable<String>(status);
    map['reported_at'] = Variable<DateTime>(reportedAt);
    if (!nullToAbsent || resolvedAt != null) {
      map['resolved_at'] = Variable<DateTime>(resolvedAt);
    }
    return map;
  }

  DefectsCompanion toCompanion(bool nullToAbsent) {
    return DefectsCompanion(
      id: Value(id),
      activityId: activityId == null && nullToAbsent
          ? const Value.absent()
          : Value(activityId),
      moduleName: moduleName == null && nullToAbsent
          ? const Value.absent()
          : Value(moduleName),
      description: Value(description),
      severity: Value(severity),
      assignedTo: assignedTo == null && nullToAbsent
          ? const Value.absent()
          : Value(assignedTo),
      status: Value(status),
      reportedAt: Value(reportedAt),
      resolvedAt: resolvedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(resolvedAt),
    );
  }

  factory Defect.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Defect(
      id: serializer.fromJson<int>(json['id']),
      activityId: serializer.fromJson<int?>(json['activityId']),
      moduleName: serializer.fromJson<String?>(json['moduleName']),
      description: serializer.fromJson<String>(json['description']),
      severity: serializer.fromJson<String>(json['severity']),
      assignedTo: serializer.fromJson<int?>(json['assignedTo']),
      status: serializer.fromJson<String>(json['status']),
      reportedAt: serializer.fromJson<DateTime>(json['reportedAt']),
      resolvedAt: serializer.fromJson<DateTime?>(json['resolvedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'activityId': serializer.toJson<int?>(activityId),
      'moduleName': serializer.toJson<String?>(moduleName),
      'description': serializer.toJson<String>(description),
      'severity': serializer.toJson<String>(severity),
      'assignedTo': serializer.toJson<int?>(assignedTo),
      'status': serializer.toJson<String>(status),
      'reportedAt': serializer.toJson<DateTime>(reportedAt),
      'resolvedAt': serializer.toJson<DateTime?>(resolvedAt),
    };
  }

  Defect copyWith({
    int? id,
    Value<int?> activityId = const Value.absent(),
    Value<String?> moduleName = const Value.absent(),
    String? description,
    String? severity,
    Value<int?> assignedTo = const Value.absent(),
    String? status,
    DateTime? reportedAt,
    Value<DateTime?> resolvedAt = const Value.absent(),
  }) => Defect(
    id: id ?? this.id,
    activityId: activityId.present ? activityId.value : this.activityId,
    moduleName: moduleName.present ? moduleName.value : this.moduleName,
    description: description ?? this.description,
    severity: severity ?? this.severity,
    assignedTo: assignedTo.present ? assignedTo.value : this.assignedTo,
    status: status ?? this.status,
    reportedAt: reportedAt ?? this.reportedAt,
    resolvedAt: resolvedAt.present ? resolvedAt.value : this.resolvedAt,
  );
  Defect copyWithCompanion(DefectsCompanion data) {
    return Defect(
      id: data.id.present ? data.id.value : this.id,
      activityId: data.activityId.present
          ? data.activityId.value
          : this.activityId,
      moduleName: data.moduleName.present
          ? data.moduleName.value
          : this.moduleName,
      description: data.description.present
          ? data.description.value
          : this.description,
      severity: data.severity.present ? data.severity.value : this.severity,
      assignedTo: data.assignedTo.present
          ? data.assignedTo.value
          : this.assignedTo,
      status: data.status.present ? data.status.value : this.status,
      reportedAt: data.reportedAt.present
          ? data.reportedAt.value
          : this.reportedAt,
      resolvedAt: data.resolvedAt.present
          ? data.resolvedAt.value
          : this.resolvedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Defect(')
          ..write('id: $id, ')
          ..write('activityId: $activityId, ')
          ..write('moduleName: $moduleName, ')
          ..write('description: $description, ')
          ..write('severity: $severity, ')
          ..write('assignedTo: $assignedTo, ')
          ..write('status: $status, ')
          ..write('reportedAt: $reportedAt, ')
          ..write('resolvedAt: $resolvedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    activityId,
    moduleName,
    description,
    severity,
    assignedTo,
    status,
    reportedAt,
    resolvedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Defect &&
          other.id == this.id &&
          other.activityId == this.activityId &&
          other.moduleName == this.moduleName &&
          other.description == this.description &&
          other.severity == this.severity &&
          other.assignedTo == this.assignedTo &&
          other.status == this.status &&
          other.reportedAt == this.reportedAt &&
          other.resolvedAt == this.resolvedAt);
}

class DefectsCompanion extends UpdateCompanion<Defect> {
  final Value<int> id;
  final Value<int?> activityId;
  final Value<String?> moduleName;
  final Value<String> description;
  final Value<String> severity;
  final Value<int?> assignedTo;
  final Value<String> status;
  final Value<DateTime> reportedAt;
  final Value<DateTime?> resolvedAt;
  const DefectsCompanion({
    this.id = const Value.absent(),
    this.activityId = const Value.absent(),
    this.moduleName = const Value.absent(),
    this.description = const Value.absent(),
    this.severity = const Value.absent(),
    this.assignedTo = const Value.absent(),
    this.status = const Value.absent(),
    this.reportedAt = const Value.absent(),
    this.resolvedAt = const Value.absent(),
  });
  DefectsCompanion.insert({
    this.id = const Value.absent(),
    this.activityId = const Value.absent(),
    this.moduleName = const Value.absent(),
    required String description,
    required String severity,
    this.assignedTo = const Value.absent(),
    required String status,
    required DateTime reportedAt,
    this.resolvedAt = const Value.absent(),
  }) : description = Value(description),
       severity = Value(severity),
       status = Value(status),
       reportedAt = Value(reportedAt);
  static Insertable<Defect> custom({
    Expression<int>? id,
    Expression<int>? activityId,
    Expression<String>? moduleName,
    Expression<String>? description,
    Expression<String>? severity,
    Expression<int>? assignedTo,
    Expression<String>? status,
    Expression<DateTime>? reportedAt,
    Expression<DateTime>? resolvedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (activityId != null) 'activity_id': activityId,
      if (moduleName != null) 'module_name': moduleName,
      if (description != null) 'description': description,
      if (severity != null) 'severity': severity,
      if (assignedTo != null) 'assigned_to': assignedTo,
      if (status != null) 'status': status,
      if (reportedAt != null) 'reported_at': reportedAt,
      if (resolvedAt != null) 'resolved_at': resolvedAt,
    });
  }

  DefectsCompanion copyWith({
    Value<int>? id,
    Value<int?>? activityId,
    Value<String?>? moduleName,
    Value<String>? description,
    Value<String>? severity,
    Value<int?>? assignedTo,
    Value<String>? status,
    Value<DateTime>? reportedAt,
    Value<DateTime?>? resolvedAt,
  }) {
    return DefectsCompanion(
      id: id ?? this.id,
      activityId: activityId ?? this.activityId,
      moduleName: moduleName ?? this.moduleName,
      description: description ?? this.description,
      severity: severity ?? this.severity,
      assignedTo: assignedTo ?? this.assignedTo,
      status: status ?? this.status,
      reportedAt: reportedAt ?? this.reportedAt,
      resolvedAt: resolvedAt ?? this.resolvedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (activityId.present) {
      map['activity_id'] = Variable<int>(activityId.value);
    }
    if (moduleName.present) {
      map['module_name'] = Variable<String>(moduleName.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (severity.present) {
      map['severity'] = Variable<String>(severity.value);
    }
    if (assignedTo.present) {
      map['assigned_to'] = Variable<int>(assignedTo.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (reportedAt.present) {
      map['reported_at'] = Variable<DateTime>(reportedAt.value);
    }
    if (resolvedAt.present) {
      map['resolved_at'] = Variable<DateTime>(resolvedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DefectsCompanion(')
          ..write('id: $id, ')
          ..write('activityId: $activityId, ')
          ..write('moduleName: $moduleName, ')
          ..write('description: $description, ')
          ..write('severity: $severity, ')
          ..write('assignedTo: $assignedTo, ')
          ..write('status: $status, ')
          ..write('reportedAt: $reportedAt, ')
          ..write('resolvedAt: $resolvedAt')
          ..write(')'))
        .toString();
  }
}

class $QualityChecklistItemsTable extends QualityChecklistItems
    with TableInfo<$QualityChecklistItemsTable, QualityChecklistItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QualityChecklistItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _deliverableMeta = const VerificationMeta(
    'deliverable',
  );
  @override
  late final GeneratedColumn<String> deliverable = GeneratedColumn<String>(
    'deliverable',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _criterionMeta = const VerificationMeta(
    'criterion',
  );
  @override
  late final GeneratedColumn<String> criterion = GeneratedColumn<String>(
    'criterion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _inspectionResultMeta = const VerificationMeta(
    'inspectionResult',
  );
  @override
  late final GeneratedColumn<String> inspectionResult = GeneratedColumn<String>(
    'inspection_result',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _testedByMeta = const VerificationMeta(
    'testedBy',
  );
  @override
  late final GeneratedColumn<int> testedBy = GeneratedColumn<int>(
    'tested_by',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _testedAtMeta = const VerificationMeta(
    'testedAt',
  );
  @override
  late final GeneratedColumn<DateTime> testedAt = GeneratedColumn<DateTime>(
    'tested_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    deliverable,
    criterion,
    inspectionResult,
    testedBy,
    testedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quality_checklist_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<QualityChecklistItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('deliverable')) {
      context.handle(
        _deliverableMeta,
        deliverable.isAcceptableOrUnknown(
          data['deliverable']!,
          _deliverableMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_deliverableMeta);
    }
    if (data.containsKey('criterion')) {
      context.handle(
        _criterionMeta,
        criterion.isAcceptableOrUnknown(data['criterion']!, _criterionMeta),
      );
    } else if (isInserting) {
      context.missing(_criterionMeta);
    }
    if (data.containsKey('inspection_result')) {
      context.handle(
        _inspectionResultMeta,
        inspectionResult.isAcceptableOrUnknown(
          data['inspection_result']!,
          _inspectionResultMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_inspectionResultMeta);
    }
    if (data.containsKey('tested_by')) {
      context.handle(
        _testedByMeta,
        testedBy.isAcceptableOrUnknown(data['tested_by']!, _testedByMeta),
      );
    }
    if (data.containsKey('tested_at')) {
      context.handle(
        _testedAtMeta,
        testedAt.isAcceptableOrUnknown(data['tested_at']!, _testedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QualityChecklistItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QualityChecklistItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      deliverable: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}deliverable'],
      )!,
      criterion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}criterion'],
      )!,
      inspectionResult: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}inspection_result'],
      )!,
      testedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tested_by'],
      ),
      testedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}tested_at'],
      ),
    );
  }

  @override
  $QualityChecklistItemsTable createAlias(String alias) {
    return $QualityChecklistItemsTable(attachedDatabase, alias);
  }
}

class QualityChecklistItem extends DataClass
    implements Insertable<QualityChecklistItem> {
  final int id;
  final String deliverable;
  final String criterion;
  final String inspectionResult;
  final int? testedBy;
  final DateTime? testedAt;
  const QualityChecklistItem({
    required this.id,
    required this.deliverable,
    required this.criterion,
    required this.inspectionResult,
    this.testedBy,
    this.testedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['deliverable'] = Variable<String>(deliverable);
    map['criterion'] = Variable<String>(criterion);
    map['inspection_result'] = Variable<String>(inspectionResult);
    if (!nullToAbsent || testedBy != null) {
      map['tested_by'] = Variable<int>(testedBy);
    }
    if (!nullToAbsent || testedAt != null) {
      map['tested_at'] = Variable<DateTime>(testedAt);
    }
    return map;
  }

  QualityChecklistItemsCompanion toCompanion(bool nullToAbsent) {
    return QualityChecklistItemsCompanion(
      id: Value(id),
      deliverable: Value(deliverable),
      criterion: Value(criterion),
      inspectionResult: Value(inspectionResult),
      testedBy: testedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(testedBy),
      testedAt: testedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(testedAt),
    );
  }

  factory QualityChecklistItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QualityChecklistItem(
      id: serializer.fromJson<int>(json['id']),
      deliverable: serializer.fromJson<String>(json['deliverable']),
      criterion: serializer.fromJson<String>(json['criterion']),
      inspectionResult: serializer.fromJson<String>(json['inspectionResult']),
      testedBy: serializer.fromJson<int?>(json['testedBy']),
      testedAt: serializer.fromJson<DateTime?>(json['testedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'deliverable': serializer.toJson<String>(deliverable),
      'criterion': serializer.toJson<String>(criterion),
      'inspectionResult': serializer.toJson<String>(inspectionResult),
      'testedBy': serializer.toJson<int?>(testedBy),
      'testedAt': serializer.toJson<DateTime?>(testedAt),
    };
  }

  QualityChecklistItem copyWith({
    int? id,
    String? deliverable,
    String? criterion,
    String? inspectionResult,
    Value<int?> testedBy = const Value.absent(),
    Value<DateTime?> testedAt = const Value.absent(),
  }) => QualityChecklistItem(
    id: id ?? this.id,
    deliverable: deliverable ?? this.deliverable,
    criterion: criterion ?? this.criterion,
    inspectionResult: inspectionResult ?? this.inspectionResult,
    testedBy: testedBy.present ? testedBy.value : this.testedBy,
    testedAt: testedAt.present ? testedAt.value : this.testedAt,
  );
  QualityChecklistItem copyWithCompanion(QualityChecklistItemsCompanion data) {
    return QualityChecklistItem(
      id: data.id.present ? data.id.value : this.id,
      deliverable: data.deliverable.present
          ? data.deliverable.value
          : this.deliverable,
      criterion: data.criterion.present ? data.criterion.value : this.criterion,
      inspectionResult: data.inspectionResult.present
          ? data.inspectionResult.value
          : this.inspectionResult,
      testedBy: data.testedBy.present ? data.testedBy.value : this.testedBy,
      testedAt: data.testedAt.present ? data.testedAt.value : this.testedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QualityChecklistItem(')
          ..write('id: $id, ')
          ..write('deliverable: $deliverable, ')
          ..write('criterion: $criterion, ')
          ..write('inspectionResult: $inspectionResult, ')
          ..write('testedBy: $testedBy, ')
          ..write('testedAt: $testedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    deliverable,
    criterion,
    inspectionResult,
    testedBy,
    testedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QualityChecklistItem &&
          other.id == this.id &&
          other.deliverable == this.deliverable &&
          other.criterion == this.criterion &&
          other.inspectionResult == this.inspectionResult &&
          other.testedBy == this.testedBy &&
          other.testedAt == this.testedAt);
}

class QualityChecklistItemsCompanion
    extends UpdateCompanion<QualityChecklistItem> {
  final Value<int> id;
  final Value<String> deliverable;
  final Value<String> criterion;
  final Value<String> inspectionResult;
  final Value<int?> testedBy;
  final Value<DateTime?> testedAt;
  const QualityChecklistItemsCompanion({
    this.id = const Value.absent(),
    this.deliverable = const Value.absent(),
    this.criterion = const Value.absent(),
    this.inspectionResult = const Value.absent(),
    this.testedBy = const Value.absent(),
    this.testedAt = const Value.absent(),
  });
  QualityChecklistItemsCompanion.insert({
    this.id = const Value.absent(),
    required String deliverable,
    required String criterion,
    required String inspectionResult,
    this.testedBy = const Value.absent(),
    this.testedAt = const Value.absent(),
  }) : deliverable = Value(deliverable),
       criterion = Value(criterion),
       inspectionResult = Value(inspectionResult);
  static Insertable<QualityChecklistItem> custom({
    Expression<int>? id,
    Expression<String>? deliverable,
    Expression<String>? criterion,
    Expression<String>? inspectionResult,
    Expression<int>? testedBy,
    Expression<DateTime>? testedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (deliverable != null) 'deliverable': deliverable,
      if (criterion != null) 'criterion': criterion,
      if (inspectionResult != null) 'inspection_result': inspectionResult,
      if (testedBy != null) 'tested_by': testedBy,
      if (testedAt != null) 'tested_at': testedAt,
    });
  }

  QualityChecklistItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? deliverable,
    Value<String>? criterion,
    Value<String>? inspectionResult,
    Value<int?>? testedBy,
    Value<DateTime?>? testedAt,
  }) {
    return QualityChecklistItemsCompanion(
      id: id ?? this.id,
      deliverable: deliverable ?? this.deliverable,
      criterion: criterion ?? this.criterion,
      inspectionResult: inspectionResult ?? this.inspectionResult,
      testedBy: testedBy ?? this.testedBy,
      testedAt: testedAt ?? this.testedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (deliverable.present) {
      map['deliverable'] = Variable<String>(deliverable.value);
    }
    if (criterion.present) {
      map['criterion'] = Variable<String>(criterion.value);
    }
    if (inspectionResult.present) {
      map['inspection_result'] = Variable<String>(inspectionResult.value);
    }
    if (testedBy.present) {
      map['tested_by'] = Variable<int>(testedBy.value);
    }
    if (testedAt.present) {
      map['tested_at'] = Variable<DateTime>(testedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QualityChecklistItemsCompanion(')
          ..write('id: $id, ')
          ..write('deliverable: $deliverable, ')
          ..write('criterion: $criterion, ')
          ..write('inspectionResult: $inspectionResult, ')
          ..write('testedBy: $testedBy, ')
          ..write('testedAt: $testedAt')
          ..write(')'))
        .toString();
  }
}

class $RisksTable extends Risks with TableInfo<$RisksTable, Risk> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RisksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _likelihoodMeta = const VerificationMeta(
    'likelihood',
  );
  @override
  late final GeneratedColumn<int> likelihood = GeneratedColumn<int>(
    'likelihood',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _impactMeta = const VerificationMeta('impact');
  @override
  late final GeneratedColumn<int> impact = GeneratedColumn<int>(
    'impact',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
    'score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _responseTypeMeta = const VerificationMeta(
    'responseType',
  );
  @override
  late final GeneratedColumn<String> responseType = GeneratedColumn<String>(
    'response_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _preventiveActionMeta = const VerificationMeta(
    'preventiveAction',
  );
  @override
  late final GeneratedColumn<String> preventiveAction = GeneratedColumn<String>(
    'preventive_action',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _correctiveActionMeta = const VerificationMeta(
    'correctiveAction',
  );
  @override
  late final GeneratedColumn<String> correctiveAction = GeneratedColumn<String>(
    'corrective_action',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    likelihood,
    impact,
    score,
    responseType,
    preventiveAction,
    correctiveAction,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'risks';
  @override
  VerificationContext validateIntegrity(
    Insertable<Risk> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('likelihood')) {
      context.handle(
        _likelihoodMeta,
        likelihood.isAcceptableOrUnknown(data['likelihood']!, _likelihoodMeta),
      );
    } else if (isInserting) {
      context.missing(_likelihoodMeta);
    }
    if (data.containsKey('impact')) {
      context.handle(
        _impactMeta,
        impact.isAcceptableOrUnknown(data['impact']!, _impactMeta),
      );
    } else if (isInserting) {
      context.missing(_impactMeta);
    }
    if (data.containsKey('score')) {
      context.handle(
        _scoreMeta,
        score.isAcceptableOrUnknown(data['score']!, _scoreMeta),
      );
    } else if (isInserting) {
      context.missing(_scoreMeta);
    }
    if (data.containsKey('response_type')) {
      context.handle(
        _responseTypeMeta,
        responseType.isAcceptableOrUnknown(
          data['response_type']!,
          _responseTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_responseTypeMeta);
    }
    if (data.containsKey('preventive_action')) {
      context.handle(
        _preventiveActionMeta,
        preventiveAction.isAcceptableOrUnknown(
          data['preventive_action']!,
          _preventiveActionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_preventiveActionMeta);
    }
    if (data.containsKey('corrective_action')) {
      context.handle(
        _correctiveActionMeta,
        correctiveAction.isAcceptableOrUnknown(
          data['corrective_action']!,
          _correctiveActionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_correctiveActionMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Risk map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Risk(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      likelihood: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}likelihood'],
      )!,
      impact: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}impact'],
      )!,
      score: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}score'],
      )!,
      responseType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}response_type'],
      )!,
      preventiveAction: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}preventive_action'],
      )!,
      correctiveAction: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}corrective_action'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $RisksTable createAlias(String alias) {
    return $RisksTable(attachedDatabase, alias);
  }
}

class Risk extends DataClass implements Insertable<Risk> {
  final int id;
  final String title;
  final String description;
  final int likelihood;
  final int impact;
  final int score;
  final String responseType;
  final String preventiveAction;
  final String correctiveAction;
  final String status;
  const Risk({
    required this.id,
    required this.title,
    required this.description,
    required this.likelihood,
    required this.impact,
    required this.score,
    required this.responseType,
    required this.preventiveAction,
    required this.correctiveAction,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['likelihood'] = Variable<int>(likelihood);
    map['impact'] = Variable<int>(impact);
    map['score'] = Variable<int>(score);
    map['response_type'] = Variable<String>(responseType);
    map['preventive_action'] = Variable<String>(preventiveAction);
    map['corrective_action'] = Variable<String>(correctiveAction);
    map['status'] = Variable<String>(status);
    return map;
  }

  RisksCompanion toCompanion(bool nullToAbsent) {
    return RisksCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      likelihood: Value(likelihood),
      impact: Value(impact),
      score: Value(score),
      responseType: Value(responseType),
      preventiveAction: Value(preventiveAction),
      correctiveAction: Value(correctiveAction),
      status: Value(status),
    );
  }

  factory Risk.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Risk(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      likelihood: serializer.fromJson<int>(json['likelihood']),
      impact: serializer.fromJson<int>(json['impact']),
      score: serializer.fromJson<int>(json['score']),
      responseType: serializer.fromJson<String>(json['responseType']),
      preventiveAction: serializer.fromJson<String>(json['preventiveAction']),
      correctiveAction: serializer.fromJson<String>(json['correctiveAction']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'likelihood': serializer.toJson<int>(likelihood),
      'impact': serializer.toJson<int>(impact),
      'score': serializer.toJson<int>(score),
      'responseType': serializer.toJson<String>(responseType),
      'preventiveAction': serializer.toJson<String>(preventiveAction),
      'correctiveAction': serializer.toJson<String>(correctiveAction),
      'status': serializer.toJson<String>(status),
    };
  }

  Risk copyWith({
    int? id,
    String? title,
    String? description,
    int? likelihood,
    int? impact,
    int? score,
    String? responseType,
    String? preventiveAction,
    String? correctiveAction,
    String? status,
  }) => Risk(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    likelihood: likelihood ?? this.likelihood,
    impact: impact ?? this.impact,
    score: score ?? this.score,
    responseType: responseType ?? this.responseType,
    preventiveAction: preventiveAction ?? this.preventiveAction,
    correctiveAction: correctiveAction ?? this.correctiveAction,
    status: status ?? this.status,
  );
  Risk copyWithCompanion(RisksCompanion data) {
    return Risk(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      likelihood: data.likelihood.present
          ? data.likelihood.value
          : this.likelihood,
      impact: data.impact.present ? data.impact.value : this.impact,
      score: data.score.present ? data.score.value : this.score,
      responseType: data.responseType.present
          ? data.responseType.value
          : this.responseType,
      preventiveAction: data.preventiveAction.present
          ? data.preventiveAction.value
          : this.preventiveAction,
      correctiveAction: data.correctiveAction.present
          ? data.correctiveAction.value
          : this.correctiveAction,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Risk(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('likelihood: $likelihood, ')
          ..write('impact: $impact, ')
          ..write('score: $score, ')
          ..write('responseType: $responseType, ')
          ..write('preventiveAction: $preventiveAction, ')
          ..write('correctiveAction: $correctiveAction, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    description,
    likelihood,
    impact,
    score,
    responseType,
    preventiveAction,
    correctiveAction,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Risk &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.likelihood == this.likelihood &&
          other.impact == this.impact &&
          other.score == this.score &&
          other.responseType == this.responseType &&
          other.preventiveAction == this.preventiveAction &&
          other.correctiveAction == this.correctiveAction &&
          other.status == this.status);
}

class RisksCompanion extends UpdateCompanion<Risk> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<int> likelihood;
  final Value<int> impact;
  final Value<int> score;
  final Value<String> responseType;
  final Value<String> preventiveAction;
  final Value<String> correctiveAction;
  final Value<String> status;
  const RisksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.likelihood = const Value.absent(),
    this.impact = const Value.absent(),
    this.score = const Value.absent(),
    this.responseType = const Value.absent(),
    this.preventiveAction = const Value.absent(),
    this.correctiveAction = const Value.absent(),
    this.status = const Value.absent(),
  });
  RisksCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required int likelihood,
    required int impact,
    required int score,
    required String responseType,
    required String preventiveAction,
    required String correctiveAction,
    required String status,
  }) : title = Value(title),
       description = Value(description),
       likelihood = Value(likelihood),
       impact = Value(impact),
       score = Value(score),
       responseType = Value(responseType),
       preventiveAction = Value(preventiveAction),
       correctiveAction = Value(correctiveAction),
       status = Value(status);
  static Insertable<Risk> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? likelihood,
    Expression<int>? impact,
    Expression<int>? score,
    Expression<String>? responseType,
    Expression<String>? preventiveAction,
    Expression<String>? correctiveAction,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (likelihood != null) 'likelihood': likelihood,
      if (impact != null) 'impact': impact,
      if (score != null) 'score': score,
      if (responseType != null) 'response_type': responseType,
      if (preventiveAction != null) 'preventive_action': preventiveAction,
      if (correctiveAction != null) 'corrective_action': correctiveAction,
      if (status != null) 'status': status,
    });
  }

  RisksCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? description,
    Value<int>? likelihood,
    Value<int>? impact,
    Value<int>? score,
    Value<String>? responseType,
    Value<String>? preventiveAction,
    Value<String>? correctiveAction,
    Value<String>? status,
  }) {
    return RisksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      likelihood: likelihood ?? this.likelihood,
      impact: impact ?? this.impact,
      score: score ?? this.score,
      responseType: responseType ?? this.responseType,
      preventiveAction: preventiveAction ?? this.preventiveAction,
      correctiveAction: correctiveAction ?? this.correctiveAction,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (likelihood.present) {
      map['likelihood'] = Variable<int>(likelihood.value);
    }
    if (impact.present) {
      map['impact'] = Variable<int>(impact.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    if (responseType.present) {
      map['response_type'] = Variable<String>(responseType.value);
    }
    if (preventiveAction.present) {
      map['preventive_action'] = Variable<String>(preventiveAction.value);
    }
    if (correctiveAction.present) {
      map['corrective_action'] = Variable<String>(correctiveAction.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RisksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('likelihood: $likelihood, ')
          ..write('impact: $impact, ')
          ..write('score: $score, ')
          ..write('responseType: $responseType, ')
          ..write('preventiveAction: $preventiveAction, ')
          ..write('correctiveAction: $correctiveAction, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $AuditLogTable extends AuditLog
    with TableInfo<$AuditLogTable, AuditLogData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuditLogTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _entityMeta = const VerificationMeta('entity');
  @override
  late final GeneratedColumn<String> entity = GeneratedColumn<String>(
    'entity',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<int> entityId = GeneratedColumn<int>(
    'entity_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
    'action',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    entity,
    entityId,
    action,
    timestamp,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audit_log';
  @override
  VerificationContext validateIntegrity(
    Insertable<AuditLogData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entity')) {
      context.handle(
        _entityMeta,
        entity.isAcceptableOrUnknown(data['entity']!, _entityMeta),
      );
    } else if (isInserting) {
      context.missing(_entityMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('action')) {
      context.handle(
        _actionMeta,
        action.isAcceptableOrUnknown(data['action']!, _actionMeta),
      );
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuditLogData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuditLogData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      entity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}entity_id'],
      )!,
      action: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
    );
  }

  @override
  $AuditLogTable createAlias(String alias) {
    return $AuditLogTable(attachedDatabase, alias);
  }
}

class AuditLogData extends DataClass implements Insertable<AuditLogData> {
  final int id;
  final String entity;
  final int entityId;
  final String action;
  final DateTime timestamp;
  const AuditLogData({
    required this.id,
    required this.entity,
    required this.entityId,
    required this.action,
    required this.timestamp,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entity'] = Variable<String>(entity);
    map['entity_id'] = Variable<int>(entityId);
    map['action'] = Variable<String>(action);
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  AuditLogCompanion toCompanion(bool nullToAbsent) {
    return AuditLogCompanion(
      id: Value(id),
      entity: Value(entity),
      entityId: Value(entityId),
      action: Value(action),
      timestamp: Value(timestamp),
    );
  }

  factory AuditLogData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuditLogData(
      id: serializer.fromJson<int>(json['id']),
      entity: serializer.fromJson<String>(json['entity']),
      entityId: serializer.fromJson<int>(json['entityId']),
      action: serializer.fromJson<String>(json['action']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entity': serializer.toJson<String>(entity),
      'entityId': serializer.toJson<int>(entityId),
      'action': serializer.toJson<String>(action),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  AuditLogData copyWith({
    int? id,
    String? entity,
    int? entityId,
    String? action,
    DateTime? timestamp,
  }) => AuditLogData(
    id: id ?? this.id,
    entity: entity ?? this.entity,
    entityId: entityId ?? this.entityId,
    action: action ?? this.action,
    timestamp: timestamp ?? this.timestamp,
  );
  AuditLogData copyWithCompanion(AuditLogCompanion data) {
    return AuditLogData(
      id: data.id.present ? data.id.value : this.id,
      entity: data.entity.present ? data.entity.value : this.entity,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      action: data.action.present ? data.action.value : this.action,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuditLogData(')
          ..write('id: $id, ')
          ..write('entity: $entity, ')
          ..write('entityId: $entityId, ')
          ..write('action: $action, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, entity, entityId, action, timestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuditLogData &&
          other.id == this.id &&
          other.entity == this.entity &&
          other.entityId == this.entityId &&
          other.action == this.action &&
          other.timestamp == this.timestamp);
}

class AuditLogCompanion extends UpdateCompanion<AuditLogData> {
  final Value<int> id;
  final Value<String> entity;
  final Value<int> entityId;
  final Value<String> action;
  final Value<DateTime> timestamp;
  const AuditLogCompanion({
    this.id = const Value.absent(),
    this.entity = const Value.absent(),
    this.entityId = const Value.absent(),
    this.action = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  AuditLogCompanion.insert({
    this.id = const Value.absent(),
    required String entity,
    required int entityId,
    required String action,
    required DateTime timestamp,
  }) : entity = Value(entity),
       entityId = Value(entityId),
       action = Value(action),
       timestamp = Value(timestamp);
  static Insertable<AuditLogData> custom({
    Expression<int>? id,
    Expression<String>? entity,
    Expression<int>? entityId,
    Expression<String>? action,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entity != null) 'entity': entity,
      if (entityId != null) 'entity_id': entityId,
      if (action != null) 'action': action,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  AuditLogCompanion copyWith({
    Value<int>? id,
    Value<String>? entity,
    Value<int>? entityId,
    Value<String>? action,
    Value<DateTime>? timestamp,
  }) {
    return AuditLogCompanion(
      id: id ?? this.id,
      entity: entity ?? this.entity,
      entityId: entityId ?? this.entityId,
      action: action ?? this.action,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entity.present) {
      map['entity'] = Variable<String>(entity.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<int>(entityId.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuditLogCompanion(')
          ..write('id: $id, ')
          ..write('entity: $entity, ')
          ..write('entityId: $entityId, ')
          ..write('action: $action, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProjectCharterTable projectCharter = $ProjectCharterTable(this);
  late final $StakeholdersTable stakeholders = $StakeholdersTable(this);
  late final $RequirementsTable requirements = $RequirementsTable(this);
  late final $WbsNodesTable wbsNodes = $WbsNodesTable(this);
  late final $ChangeRequestsTable changeRequests = $ChangeRequestsTable(this);
  late final $ActivitiesTable activities = $ActivitiesTable(this);
  late final $ActivityDependenciesTable activityDependencies =
      $ActivityDependenciesTable(this);
  late final $TeamMembersTable teamMembers = $TeamMembersTable(this);
  late final $ActivityCostsTable activityCosts = $ActivityCostsTable(this);
  late final $EvmSnapshotsTable evmSnapshots = $EvmSnapshotsTable(this);
  late final $DefectsTable defects = $DefectsTable(this);
  late final $QualityChecklistItemsTable qualityChecklistItems =
      $QualityChecklistItemsTable(this);
  late final $RisksTable risks = $RisksTable(this);
  late final $AuditLogTable auditLog = $AuditLogTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    projectCharter,
    stakeholders,
    requirements,
    wbsNodes,
    changeRequests,
    activities,
    activityDependencies,
    teamMembers,
    activityCosts,
    evmSnapshots,
    defects,
    qualityChecklistItems,
    risks,
    auditLog,
  ];
}

typedef $$ProjectCharterTableCreateCompanionBuilder =
    ProjectCharterCompanion Function({
      Value<int> id,
      required String projectName,
      required String objectives,
      required String scopeBoundaries,
      required double approvedBudget,
      required DateTime deadlineDate,
      required String status,
      required DateTime createdAt,
    });
typedef $$ProjectCharterTableUpdateCompanionBuilder =
    ProjectCharterCompanion Function({
      Value<int> id,
      Value<String> projectName,
      Value<String> objectives,
      Value<String> scopeBoundaries,
      Value<double> approvedBudget,
      Value<DateTime> deadlineDate,
      Value<String> status,
      Value<DateTime> createdAt,
    });

class $$ProjectCharterTableFilterComposer
    extends Composer<_$AppDatabase, $ProjectCharterTable> {
  $$ProjectCharterTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get projectName => $composableBuilder(
    column: $table.projectName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get objectives => $composableBuilder(
    column: $table.objectives,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get scopeBoundaries => $composableBuilder(
    column: $table.scopeBoundaries,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get approvedBudget => $composableBuilder(
    column: $table.approvedBudget,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deadlineDate => $composableBuilder(
    column: $table.deadlineDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProjectCharterTableOrderingComposer
    extends Composer<_$AppDatabase, $ProjectCharterTable> {
  $$ProjectCharterTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get projectName => $composableBuilder(
    column: $table.projectName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get objectives => $composableBuilder(
    column: $table.objectives,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get scopeBoundaries => $composableBuilder(
    column: $table.scopeBoundaries,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get approvedBudget => $composableBuilder(
    column: $table.approvedBudget,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deadlineDate => $composableBuilder(
    column: $table.deadlineDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProjectCharterTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProjectCharterTable> {
  $$ProjectCharterTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get projectName => $composableBuilder(
    column: $table.projectName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get objectives => $composableBuilder(
    column: $table.objectives,
    builder: (column) => column,
  );

  GeneratedColumn<String> get scopeBoundaries => $composableBuilder(
    column: $table.scopeBoundaries,
    builder: (column) => column,
  );

  GeneratedColumn<double> get approvedBudget => $composableBuilder(
    column: $table.approvedBudget,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deadlineDate => $composableBuilder(
    column: $table.deadlineDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ProjectCharterTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProjectCharterTable,
          ProjectCharterData,
          $$ProjectCharterTableFilterComposer,
          $$ProjectCharterTableOrderingComposer,
          $$ProjectCharterTableAnnotationComposer,
          $$ProjectCharterTableCreateCompanionBuilder,
          $$ProjectCharterTableUpdateCompanionBuilder,
          (
            ProjectCharterData,
            BaseReferences<
              _$AppDatabase,
              $ProjectCharterTable,
              ProjectCharterData
            >,
          ),
          ProjectCharterData,
          PrefetchHooks Function()
        > {
  $$ProjectCharterTableTableManager(
    _$AppDatabase db,
    $ProjectCharterTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProjectCharterTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProjectCharterTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProjectCharterTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> projectName = const Value.absent(),
                Value<String> objectives = const Value.absent(),
                Value<String> scopeBoundaries = const Value.absent(),
                Value<double> approvedBudget = const Value.absent(),
                Value<DateTime> deadlineDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ProjectCharterCompanion(
                id: id,
                projectName: projectName,
                objectives: objectives,
                scopeBoundaries: scopeBoundaries,
                approvedBudget: approvedBudget,
                deadlineDate: deadlineDate,
                status: status,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String projectName,
                required String objectives,
                required String scopeBoundaries,
                required double approvedBudget,
                required DateTime deadlineDate,
                required String status,
                required DateTime createdAt,
              }) => ProjectCharterCompanion.insert(
                id: id,
                projectName: projectName,
                objectives: objectives,
                scopeBoundaries: scopeBoundaries,
                approvedBudget: approvedBudget,
                deadlineDate: deadlineDate,
                status: status,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ProjectCharterTable, ProjectCharterData>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $ProjectCharterTable,
                    ProjectCharterData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProjectCharterTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProjectCharterTable,
      ProjectCharterData,
      $$ProjectCharterTableFilterComposer,
      $$ProjectCharterTableOrderingComposer,
      $$ProjectCharterTableAnnotationComposer,
      $$ProjectCharterTableCreateCompanionBuilder,
      $$ProjectCharterTableUpdateCompanionBuilder,
      (
        ProjectCharterData,
        BaseReferences<_$AppDatabase, $ProjectCharterTable, ProjectCharterData>,
      ),
      ProjectCharterData,
      PrefetchHooks Function()
    >;
typedef $$StakeholdersTableCreateCompanionBuilder =
    StakeholdersCompanion Function({
      Value<int> id,
      required String name,
      required String role,
      required String contact,
      required String influenceLevel,
    });
typedef $$StakeholdersTableUpdateCompanionBuilder =
    StakeholdersCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> role,
      Value<String> contact,
      Value<String> influenceLevel,
    });

class $$StakeholdersTableFilterComposer
    extends Composer<_$AppDatabase, $StakeholdersTable> {
  $$StakeholdersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contact => $composableBuilder(
    column: $table.contact,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get influenceLevel => $composableBuilder(
    column: $table.influenceLevel,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StakeholdersTableOrderingComposer
    extends Composer<_$AppDatabase, $StakeholdersTable> {
  $$StakeholdersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contact => $composableBuilder(
    column: $table.contact,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get influenceLevel => $composableBuilder(
    column: $table.influenceLevel,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StakeholdersTableAnnotationComposer
    extends Composer<_$AppDatabase, $StakeholdersTable> {
  $$StakeholdersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get contact =>
      $composableBuilder(column: $table.contact, builder: (column) => column);

  GeneratedColumn<String> get influenceLevel => $composableBuilder(
    column: $table.influenceLevel,
    builder: (column) => column,
  );
}

class $$StakeholdersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StakeholdersTable,
          Stakeholder,
          $$StakeholdersTableFilterComposer,
          $$StakeholdersTableOrderingComposer,
          $$StakeholdersTableAnnotationComposer,
          $$StakeholdersTableCreateCompanionBuilder,
          $$StakeholdersTableUpdateCompanionBuilder,
          (
            Stakeholder,
            BaseReferences<_$AppDatabase, $StakeholdersTable, Stakeholder>,
          ),
          Stakeholder,
          PrefetchHooks Function()
        > {
  $$StakeholdersTableTableManager(_$AppDatabase db, $StakeholdersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StakeholdersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StakeholdersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StakeholdersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<String> contact = const Value.absent(),
                Value<String> influenceLevel = const Value.absent(),
              }) => StakeholdersCompanion(
                id: id,
                name: name,
                role: role,
                contact: contact,
                influenceLevel: influenceLevel,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String role,
                required String contact,
                required String influenceLevel,
              }) => StakeholdersCompanion.insert(
                id: id,
                name: name,
                role: role,
                contact: contact,
                influenceLevel: influenceLevel,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$StakeholdersTable, Stakeholder>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $StakeholdersTable,
                    Stakeholder
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StakeholdersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StakeholdersTable,
      Stakeholder,
      $$StakeholdersTableFilterComposer,
      $$StakeholdersTableOrderingComposer,
      $$StakeholdersTableAnnotationComposer,
      $$StakeholdersTableCreateCompanionBuilder,
      $$StakeholdersTableUpdateCompanionBuilder,
      (
        Stakeholder,
        BaseReferences<_$AppDatabase, $StakeholdersTable, Stakeholder>,
      ),
      Stakeholder,
      PrefetchHooks Function()
    >;
typedef $$RequirementsTableCreateCompanionBuilder =
    RequirementsCompanion Function({
      Value<int> id,
      required String title,
      required String description,
      required String priority,
      required String status,
      required bool isInScope,
      required DateTime createdAt,
    });
typedef $$RequirementsTableUpdateCompanionBuilder =
    RequirementsCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> description,
      Value<String> priority,
      Value<String> status,
      Value<bool> isInScope,
      Value<DateTime> createdAt,
    });

class $$RequirementsTableFilterComposer
    extends Composer<_$AppDatabase, $RequirementsTable> {
  $$RequirementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isInScope => $composableBuilder(
    column: $table.isInScope,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RequirementsTableOrderingComposer
    extends Composer<_$AppDatabase, $RequirementsTable> {
  $$RequirementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isInScope => $composableBuilder(
    column: $table.isInScope,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RequirementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RequirementsTable> {
  $$RequirementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<bool> get isInScope =>
      $composableBuilder(column: $table.isInScope, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$RequirementsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RequirementsTable,
          Requirement,
          $$RequirementsTableFilterComposer,
          $$RequirementsTableOrderingComposer,
          $$RequirementsTableAnnotationComposer,
          $$RequirementsTableCreateCompanionBuilder,
          $$RequirementsTableUpdateCompanionBuilder,
          (
            Requirement,
            BaseReferences<_$AppDatabase, $RequirementsTable, Requirement>,
          ),
          Requirement,
          PrefetchHooks Function()
        > {
  $$RequirementsTableTableManager(_$AppDatabase db, $RequirementsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RequirementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RequirementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RequirementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> priority = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<bool> isInScope = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => RequirementsCompanion(
                id: id,
                title: title,
                description: description,
                priority: priority,
                status: status,
                isInScope: isInScope,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String description,
                required String priority,
                required String status,
                required bool isInScope,
                required DateTime createdAt,
              }) => RequirementsCompanion.insert(
                id: id,
                title: title,
                description: description,
                priority: priority,
                status: status,
                isInScope: isInScope,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$RequirementsTable, Requirement>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $RequirementsTable,
                    Requirement
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RequirementsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RequirementsTable,
      Requirement,
      $$RequirementsTableFilterComposer,
      $$RequirementsTableOrderingComposer,
      $$RequirementsTableAnnotationComposer,
      $$RequirementsTableCreateCompanionBuilder,
      $$RequirementsTableUpdateCompanionBuilder,
      (
        Requirement,
        BaseReferences<_$AppDatabase, $RequirementsTable, Requirement>,
      ),
      Requirement,
      PrefetchHooks Function()
    >;
typedef $$WbsNodesTableCreateCompanionBuilder =
    WbsNodesCompanion Function({
      Value<int> id,
      Value<int?> parentId,
      required String title,
      required int level,
      required String deliverableType,
      Value<int?> linkedRequirementId,
    });
typedef $$WbsNodesTableUpdateCompanionBuilder =
    WbsNodesCompanion Function({
      Value<int> id,
      Value<int?> parentId,
      Value<String> title,
      Value<int> level,
      Value<String> deliverableType,
      Value<int?> linkedRequirementId,
    });

class $$WbsNodesTableFilterComposer
    extends Composer<_$AppDatabase, $WbsNodesTable> {
  $$WbsNodesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deliverableType => $composableBuilder(
    column: $table.deliverableType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get linkedRequirementId => $composableBuilder(
    column: $table.linkedRequirementId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WbsNodesTableOrderingComposer
    extends Composer<_$AppDatabase, $WbsNodesTable> {
  $$WbsNodesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deliverableType => $composableBuilder(
    column: $table.deliverableType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get linkedRequirementId => $composableBuilder(
    column: $table.linkedRequirementId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WbsNodesTableAnnotationComposer
    extends Composer<_$AppDatabase, $WbsNodesTable> {
  $$WbsNodesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<String> get deliverableType => $composableBuilder(
    column: $table.deliverableType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get linkedRequirementId => $composableBuilder(
    column: $table.linkedRequirementId,
    builder: (column) => column,
  );
}

class $$WbsNodesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WbsNodesTable,
          WbsNode,
          $$WbsNodesTableFilterComposer,
          $$WbsNodesTableOrderingComposer,
          $$WbsNodesTableAnnotationComposer,
          $$WbsNodesTableCreateCompanionBuilder,
          $$WbsNodesTableUpdateCompanionBuilder,
          (WbsNode, BaseReferences<_$AppDatabase, $WbsNodesTable, WbsNode>),
          WbsNode,
          PrefetchHooks Function()
        > {
  $$WbsNodesTableTableManager(_$AppDatabase db, $WbsNodesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WbsNodesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WbsNodesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WbsNodesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> parentId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<int> level = const Value.absent(),
                Value<String> deliverableType = const Value.absent(),
                Value<int?> linkedRequirementId = const Value.absent(),
              }) => WbsNodesCompanion(
                id: id,
                parentId: parentId,
                title: title,
                level: level,
                deliverableType: deliverableType,
                linkedRequirementId: linkedRequirementId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> parentId = const Value.absent(),
                required String title,
                required int level,
                required String deliverableType,
                Value<int?> linkedRequirementId = const Value.absent(),
              }) => WbsNodesCompanion.insert(
                id: id,
                parentId: parentId,
                title: title,
                level: level,
                deliverableType: deliverableType,
                linkedRequirementId: linkedRequirementId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$WbsNodesTable, WbsNode>(table),
                  BaseReferences<_$AppDatabase, $WbsNodesTable, WbsNode>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WbsNodesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WbsNodesTable,
      WbsNode,
      $$WbsNodesTableFilterComposer,
      $$WbsNodesTableOrderingComposer,
      $$WbsNodesTableAnnotationComposer,
      $$WbsNodesTableCreateCompanionBuilder,
      $$WbsNodesTableUpdateCompanionBuilder,
      (WbsNode, BaseReferences<_$AppDatabase, $WbsNodesTable, WbsNode>),
      WbsNode,
      PrefetchHooks Function()
    >;
typedef $$ChangeRequestsTableCreateCompanionBuilder =
    ChangeRequestsCompanion Function({
      Value<int> id,
      required String title,
      required String justification,
      required double costImpact,
      required int scheduleImpactDays,
      required String status,
      required DateTime submittedAt,
      Value<DateTime?> decidedAt,
      required String affects,
    });
typedef $$ChangeRequestsTableUpdateCompanionBuilder =
    ChangeRequestsCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> justification,
      Value<double> costImpact,
      Value<int> scheduleImpactDays,
      Value<String> status,
      Value<DateTime> submittedAt,
      Value<DateTime?> decidedAt,
      Value<String> affects,
    });

class $$ChangeRequestsTableFilterComposer
    extends Composer<_$AppDatabase, $ChangeRequestsTable> {
  $$ChangeRequestsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get justification => $composableBuilder(
    column: $table.justification,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get costImpact => $composableBuilder(
    column: $table.costImpact,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get scheduleImpactDays => $composableBuilder(
    column: $table.scheduleImpactDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get submittedAt => $composableBuilder(
    column: $table.submittedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get decidedAt => $composableBuilder(
    column: $table.decidedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get affects => $composableBuilder(
    column: $table.affects,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ChangeRequestsTableOrderingComposer
    extends Composer<_$AppDatabase, $ChangeRequestsTable> {
  $$ChangeRequestsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get justification => $composableBuilder(
    column: $table.justification,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get costImpact => $composableBuilder(
    column: $table.costImpact,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get scheduleImpactDays => $composableBuilder(
    column: $table.scheduleImpactDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get submittedAt => $composableBuilder(
    column: $table.submittedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get decidedAt => $composableBuilder(
    column: $table.decidedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get affects => $composableBuilder(
    column: $table.affects,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ChangeRequestsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChangeRequestsTable> {
  $$ChangeRequestsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get justification => $composableBuilder(
    column: $table.justification,
    builder: (column) => column,
  );

  GeneratedColumn<double> get costImpact => $composableBuilder(
    column: $table.costImpact,
    builder: (column) => column,
  );

  GeneratedColumn<int> get scheduleImpactDays => $composableBuilder(
    column: $table.scheduleImpactDays,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get submittedAt => $composableBuilder(
    column: $table.submittedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get decidedAt =>
      $composableBuilder(column: $table.decidedAt, builder: (column) => column);

  GeneratedColumn<String> get affects =>
      $composableBuilder(column: $table.affects, builder: (column) => column);
}

class $$ChangeRequestsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChangeRequestsTable,
          ChangeRequest,
          $$ChangeRequestsTableFilterComposer,
          $$ChangeRequestsTableOrderingComposer,
          $$ChangeRequestsTableAnnotationComposer,
          $$ChangeRequestsTableCreateCompanionBuilder,
          $$ChangeRequestsTableUpdateCompanionBuilder,
          (
            ChangeRequest,
            BaseReferences<_$AppDatabase, $ChangeRequestsTable, ChangeRequest>,
          ),
          ChangeRequest,
          PrefetchHooks Function()
        > {
  $$ChangeRequestsTableTableManager(
    _$AppDatabase db,
    $ChangeRequestsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChangeRequestsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChangeRequestsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChangeRequestsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> justification = const Value.absent(),
                Value<double> costImpact = const Value.absent(),
                Value<int> scheduleImpactDays = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> submittedAt = const Value.absent(),
                Value<DateTime?> decidedAt = const Value.absent(),
                Value<String> affects = const Value.absent(),
              }) => ChangeRequestsCompanion(
                id: id,
                title: title,
                justification: justification,
                costImpact: costImpact,
                scheduleImpactDays: scheduleImpactDays,
                status: status,
                submittedAt: submittedAt,
                decidedAt: decidedAt,
                affects: affects,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String justification,
                required double costImpact,
                required int scheduleImpactDays,
                required String status,
                required DateTime submittedAt,
                Value<DateTime?> decidedAt = const Value.absent(),
                required String affects,
              }) => ChangeRequestsCompanion.insert(
                id: id,
                title: title,
                justification: justification,
                costImpact: costImpact,
                scheduleImpactDays: scheduleImpactDays,
                status: status,
                submittedAt: submittedAt,
                decidedAt: decidedAt,
                affects: affects,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ChangeRequestsTable, ChangeRequest>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $ChangeRequestsTable,
                    ChangeRequest
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ChangeRequestsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChangeRequestsTable,
      ChangeRequest,
      $$ChangeRequestsTableFilterComposer,
      $$ChangeRequestsTableOrderingComposer,
      $$ChangeRequestsTableAnnotationComposer,
      $$ChangeRequestsTableCreateCompanionBuilder,
      $$ChangeRequestsTableUpdateCompanionBuilder,
      (
        ChangeRequest,
        BaseReferences<_$AppDatabase, $ChangeRequestsTable, ChangeRequest>,
      ),
      ChangeRequest,
      PrefetchHooks Function()
    >;
typedef $$ActivitiesTableCreateCompanionBuilder =
    ActivitiesCompanion Function({
      Value<int> id,
      required int wbsNodeId,
      required String name,
      Value<int?> assignedTo,
      required int estimatedDurationDays,
      required DateTime plannedStart,
      required DateTime plannedEnd,
      Value<DateTime?> actualStart,
      Value<DateTime?> actualEnd,
      required String status,
      required double percentComplete,
    });
typedef $$ActivitiesTableUpdateCompanionBuilder =
    ActivitiesCompanion Function({
      Value<int> id,
      Value<int> wbsNodeId,
      Value<String> name,
      Value<int?> assignedTo,
      Value<int> estimatedDurationDays,
      Value<DateTime> plannedStart,
      Value<DateTime> plannedEnd,
      Value<DateTime?> actualStart,
      Value<DateTime?> actualEnd,
      Value<String> status,
      Value<double> percentComplete,
    });

class $$ActivitiesTableFilterComposer
    extends Composer<_$AppDatabase, $ActivitiesTable> {
  $$ActivitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get wbsNodeId => $composableBuilder(
    column: $table.wbsNodeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get assignedTo => $composableBuilder(
    column: $table.assignedTo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get estimatedDurationDays => $composableBuilder(
    column: $table.estimatedDurationDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get plannedStart => $composableBuilder(
    column: $table.plannedStart,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get plannedEnd => $composableBuilder(
    column: $table.plannedEnd,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get actualStart => $composableBuilder(
    column: $table.actualStart,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get actualEnd => $composableBuilder(
    column: $table.actualEnd,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get percentComplete => $composableBuilder(
    column: $table.percentComplete,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ActivitiesTableOrderingComposer
    extends Composer<_$AppDatabase, $ActivitiesTable> {
  $$ActivitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get wbsNodeId => $composableBuilder(
    column: $table.wbsNodeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get assignedTo => $composableBuilder(
    column: $table.assignedTo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get estimatedDurationDays => $composableBuilder(
    column: $table.estimatedDurationDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get plannedStart => $composableBuilder(
    column: $table.plannedStart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get plannedEnd => $composableBuilder(
    column: $table.plannedEnd,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get actualStart => $composableBuilder(
    column: $table.actualStart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get actualEnd => $composableBuilder(
    column: $table.actualEnd,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get percentComplete => $composableBuilder(
    column: $table.percentComplete,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ActivitiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ActivitiesTable> {
  $$ActivitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get wbsNodeId =>
      $composableBuilder(column: $table.wbsNodeId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get assignedTo => $composableBuilder(
    column: $table.assignedTo,
    builder: (column) => column,
  );

  GeneratedColumn<int> get estimatedDurationDays => $composableBuilder(
    column: $table.estimatedDurationDays,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get plannedStart => $composableBuilder(
    column: $table.plannedStart,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get plannedEnd => $composableBuilder(
    column: $table.plannedEnd,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get actualStart => $composableBuilder(
    column: $table.actualStart,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get actualEnd =>
      $composableBuilder(column: $table.actualEnd, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<double> get percentComplete => $composableBuilder(
    column: $table.percentComplete,
    builder: (column) => column,
  );
}

class $$ActivitiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ActivitiesTable,
          Activity,
          $$ActivitiesTableFilterComposer,
          $$ActivitiesTableOrderingComposer,
          $$ActivitiesTableAnnotationComposer,
          $$ActivitiesTableCreateCompanionBuilder,
          $$ActivitiesTableUpdateCompanionBuilder,
          (Activity, BaseReferences<_$AppDatabase, $ActivitiesTable, Activity>),
          Activity,
          PrefetchHooks Function()
        > {
  $$ActivitiesTableTableManager(_$AppDatabase db, $ActivitiesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActivitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActivitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ActivitiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> wbsNodeId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int?> assignedTo = const Value.absent(),
                Value<int> estimatedDurationDays = const Value.absent(),
                Value<DateTime> plannedStart = const Value.absent(),
                Value<DateTime> plannedEnd = const Value.absent(),
                Value<DateTime?> actualStart = const Value.absent(),
                Value<DateTime?> actualEnd = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<double> percentComplete = const Value.absent(),
              }) => ActivitiesCompanion(
                id: id,
                wbsNodeId: wbsNodeId,
                name: name,
                assignedTo: assignedTo,
                estimatedDurationDays: estimatedDurationDays,
                plannedStart: plannedStart,
                plannedEnd: plannedEnd,
                actualStart: actualStart,
                actualEnd: actualEnd,
                status: status,
                percentComplete: percentComplete,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int wbsNodeId,
                required String name,
                Value<int?> assignedTo = const Value.absent(),
                required int estimatedDurationDays,
                required DateTime plannedStart,
                required DateTime plannedEnd,
                Value<DateTime?> actualStart = const Value.absent(),
                Value<DateTime?> actualEnd = const Value.absent(),
                required String status,
                required double percentComplete,
              }) => ActivitiesCompanion.insert(
                id: id,
                wbsNodeId: wbsNodeId,
                name: name,
                assignedTo: assignedTo,
                estimatedDurationDays: estimatedDurationDays,
                plannedStart: plannedStart,
                plannedEnd: plannedEnd,
                actualStart: actualStart,
                actualEnd: actualEnd,
                status: status,
                percentComplete: percentComplete,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ActivitiesTable, Activity>(table),
                  BaseReferences<_$AppDatabase, $ActivitiesTable, Activity>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ActivitiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ActivitiesTable,
      Activity,
      $$ActivitiesTableFilterComposer,
      $$ActivitiesTableOrderingComposer,
      $$ActivitiesTableAnnotationComposer,
      $$ActivitiesTableCreateCompanionBuilder,
      $$ActivitiesTableUpdateCompanionBuilder,
      (Activity, BaseReferences<_$AppDatabase, $ActivitiesTable, Activity>),
      Activity,
      PrefetchHooks Function()
    >;
typedef $$ActivityDependenciesTableCreateCompanionBuilder =
    ActivityDependenciesCompanion Function({
      Value<int> id,
      required int predecessorId,
      required int successorId,
      required String dependencyType,
    });
typedef $$ActivityDependenciesTableUpdateCompanionBuilder =
    ActivityDependenciesCompanion Function({
      Value<int> id,
      Value<int> predecessorId,
      Value<int> successorId,
      Value<String> dependencyType,
    });

class $$ActivityDependenciesTableFilterComposer
    extends Composer<_$AppDatabase, $ActivityDependenciesTable> {
  $$ActivityDependenciesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get predecessorId => $composableBuilder(
    column: $table.predecessorId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get successorId => $composableBuilder(
    column: $table.successorId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dependencyType => $composableBuilder(
    column: $table.dependencyType,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ActivityDependenciesTableOrderingComposer
    extends Composer<_$AppDatabase, $ActivityDependenciesTable> {
  $$ActivityDependenciesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get predecessorId => $composableBuilder(
    column: $table.predecessorId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get successorId => $composableBuilder(
    column: $table.successorId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dependencyType => $composableBuilder(
    column: $table.dependencyType,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ActivityDependenciesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ActivityDependenciesTable> {
  $$ActivityDependenciesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get predecessorId => $composableBuilder(
    column: $table.predecessorId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get successorId => $composableBuilder(
    column: $table.successorId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get dependencyType => $composableBuilder(
    column: $table.dependencyType,
    builder: (column) => column,
  );
}

class $$ActivityDependenciesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ActivityDependenciesTable,
          ActivityDependency,
          $$ActivityDependenciesTableFilterComposer,
          $$ActivityDependenciesTableOrderingComposer,
          $$ActivityDependenciesTableAnnotationComposer,
          $$ActivityDependenciesTableCreateCompanionBuilder,
          $$ActivityDependenciesTableUpdateCompanionBuilder,
          (
            ActivityDependency,
            BaseReferences<
              _$AppDatabase,
              $ActivityDependenciesTable,
              ActivityDependency
            >,
          ),
          ActivityDependency,
          PrefetchHooks Function()
        > {
  $$ActivityDependenciesTableTableManager(
    _$AppDatabase db,
    $ActivityDependenciesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActivityDependenciesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActivityDependenciesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ActivityDependenciesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> predecessorId = const Value.absent(),
                Value<int> successorId = const Value.absent(),
                Value<String> dependencyType = const Value.absent(),
              }) => ActivityDependenciesCompanion(
                id: id,
                predecessorId: predecessorId,
                successorId: successorId,
                dependencyType: dependencyType,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int predecessorId,
                required int successorId,
                required String dependencyType,
              }) => ActivityDependenciesCompanion.insert(
                id: id,
                predecessorId: predecessorId,
                successorId: successorId,
                dependencyType: dependencyType,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ActivityDependenciesTable, ActivityDependency>(
                    table,
                  ),
                  BaseReferences<
                    _$AppDatabase,
                    $ActivityDependenciesTable,
                    ActivityDependency
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ActivityDependenciesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ActivityDependenciesTable,
      ActivityDependency,
      $$ActivityDependenciesTableFilterComposer,
      $$ActivityDependenciesTableOrderingComposer,
      $$ActivityDependenciesTableAnnotationComposer,
      $$ActivityDependenciesTableCreateCompanionBuilder,
      $$ActivityDependenciesTableUpdateCompanionBuilder,
      (
        ActivityDependency,
        BaseReferences<
          _$AppDatabase,
          $ActivityDependenciesTable,
          ActivityDependency
        >,
      ),
      ActivityDependency,
      PrefetchHooks Function()
    >;
typedef $$TeamMembersTableCreateCompanionBuilder =
    TeamMembersCompanion Function({
      Value<int> id,
      required String name,
      required String role,
      required double dailyRate,
    });
typedef $$TeamMembersTableUpdateCompanionBuilder =
    TeamMembersCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> role,
      Value<double> dailyRate,
    });

class $$TeamMembersTableFilterComposer
    extends Composer<_$AppDatabase, $TeamMembersTable> {
  $$TeamMembersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get dailyRate => $composableBuilder(
    column: $table.dailyRate,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TeamMembersTableOrderingComposer
    extends Composer<_$AppDatabase, $TeamMembersTable> {
  $$TeamMembersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get dailyRate => $composableBuilder(
    column: $table.dailyRate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TeamMembersTableAnnotationComposer
    extends Composer<_$AppDatabase, $TeamMembersTable> {
  $$TeamMembersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<double> get dailyRate =>
      $composableBuilder(column: $table.dailyRate, builder: (column) => column);
}

class $$TeamMembersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TeamMembersTable,
          TeamMember,
          $$TeamMembersTableFilterComposer,
          $$TeamMembersTableOrderingComposer,
          $$TeamMembersTableAnnotationComposer,
          $$TeamMembersTableCreateCompanionBuilder,
          $$TeamMembersTableUpdateCompanionBuilder,
          (
            TeamMember,
            BaseReferences<_$AppDatabase, $TeamMembersTable, TeamMember>,
          ),
          TeamMember,
          PrefetchHooks Function()
        > {
  $$TeamMembersTableTableManager(_$AppDatabase db, $TeamMembersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TeamMembersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TeamMembersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TeamMembersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<double> dailyRate = const Value.absent(),
              }) => TeamMembersCompanion(
                id: id,
                name: name,
                role: role,
                dailyRate: dailyRate,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String role,
                required double dailyRate,
              }) => TeamMembersCompanion.insert(
                id: id,
                name: name,
                role: role,
                dailyRate: dailyRate,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TeamMembersTable, TeamMember>(table),
                  BaseReferences<_$AppDatabase, $TeamMembersTable, TeamMember>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TeamMembersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TeamMembersTable,
      TeamMember,
      $$TeamMembersTableFilterComposer,
      $$TeamMembersTableOrderingComposer,
      $$TeamMembersTableAnnotationComposer,
      $$TeamMembersTableCreateCompanionBuilder,
      $$TeamMembersTableUpdateCompanionBuilder,
      (
        TeamMember,
        BaseReferences<_$AppDatabase, $TeamMembersTable, TeamMember>,
      ),
      TeamMember,
      PrefetchHooks Function()
    >;
typedef $$ActivityCostsTableCreateCompanionBuilder =
    ActivityCostsCompanion Function({
      Value<int> id,
      required int activityId,
      required double plannedCost,
      required double actualCost,
      required DateTime recordedAt,
    });
typedef $$ActivityCostsTableUpdateCompanionBuilder =
    ActivityCostsCompanion Function({
      Value<int> id,
      Value<int> activityId,
      Value<double> plannedCost,
      Value<double> actualCost,
      Value<DateTime> recordedAt,
    });

class $$ActivityCostsTableFilterComposer
    extends Composer<_$AppDatabase, $ActivityCostsTable> {
  $$ActivityCostsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get activityId => $composableBuilder(
    column: $table.activityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get plannedCost => $composableBuilder(
    column: $table.plannedCost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get actualCost => $composableBuilder(
    column: $table.actualCost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ActivityCostsTableOrderingComposer
    extends Composer<_$AppDatabase, $ActivityCostsTable> {
  $$ActivityCostsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get activityId => $composableBuilder(
    column: $table.activityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get plannedCost => $composableBuilder(
    column: $table.plannedCost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get actualCost => $composableBuilder(
    column: $table.actualCost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ActivityCostsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ActivityCostsTable> {
  $$ActivityCostsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get activityId => $composableBuilder(
    column: $table.activityId,
    builder: (column) => column,
  );

  GeneratedColumn<double> get plannedCost => $composableBuilder(
    column: $table.plannedCost,
    builder: (column) => column,
  );

  GeneratedColumn<double> get actualCost => $composableBuilder(
    column: $table.actualCost,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => column,
  );
}

class $$ActivityCostsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ActivityCostsTable,
          ActivityCost,
          $$ActivityCostsTableFilterComposer,
          $$ActivityCostsTableOrderingComposer,
          $$ActivityCostsTableAnnotationComposer,
          $$ActivityCostsTableCreateCompanionBuilder,
          $$ActivityCostsTableUpdateCompanionBuilder,
          (
            ActivityCost,
            BaseReferences<_$AppDatabase, $ActivityCostsTable, ActivityCost>,
          ),
          ActivityCost,
          PrefetchHooks Function()
        > {
  $$ActivityCostsTableTableManager(_$AppDatabase db, $ActivityCostsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActivityCostsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActivityCostsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ActivityCostsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> activityId = const Value.absent(),
                Value<double> plannedCost = const Value.absent(),
                Value<double> actualCost = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
              }) => ActivityCostsCompanion(
                id: id,
                activityId: activityId,
                plannedCost: plannedCost,
                actualCost: actualCost,
                recordedAt: recordedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int activityId,
                required double plannedCost,
                required double actualCost,
                required DateTime recordedAt,
              }) => ActivityCostsCompanion.insert(
                id: id,
                activityId: activityId,
                plannedCost: plannedCost,
                actualCost: actualCost,
                recordedAt: recordedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ActivityCostsTable, ActivityCost>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $ActivityCostsTable,
                    ActivityCost
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ActivityCostsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ActivityCostsTable,
      ActivityCost,
      $$ActivityCostsTableFilterComposer,
      $$ActivityCostsTableOrderingComposer,
      $$ActivityCostsTableAnnotationComposer,
      $$ActivityCostsTableCreateCompanionBuilder,
      $$ActivityCostsTableUpdateCompanionBuilder,
      (
        ActivityCost,
        BaseReferences<_$AppDatabase, $ActivityCostsTable, ActivityCost>,
      ),
      ActivityCost,
      PrefetchHooks Function()
    >;
typedef $$EvmSnapshotsTableCreateCompanionBuilder =
    EvmSnapshotsCompanion Function({
      Value<int> id,
      required DateTime snapshotDate,
      required double pv,
      required double ev,
      required double ac,
      required double cpi,
      required double spi,
      Value<String?> note,
    });
typedef $$EvmSnapshotsTableUpdateCompanionBuilder =
    EvmSnapshotsCompanion Function({
      Value<int> id,
      Value<DateTime> snapshotDate,
      Value<double> pv,
      Value<double> ev,
      Value<double> ac,
      Value<double> cpi,
      Value<double> spi,
      Value<String?> note,
    });

class $$EvmSnapshotsTableFilterComposer
    extends Composer<_$AppDatabase, $EvmSnapshotsTable> {
  $$EvmSnapshotsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get snapshotDate => $composableBuilder(
    column: $table.snapshotDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get pv => $composableBuilder(
    column: $table.pv,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get ev => $composableBuilder(
    column: $table.ev,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get ac => $composableBuilder(
    column: $table.ac,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get cpi => $composableBuilder(
    column: $table.cpi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get spi => $composableBuilder(
    column: $table.spi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EvmSnapshotsTableOrderingComposer
    extends Composer<_$AppDatabase, $EvmSnapshotsTable> {
  $$EvmSnapshotsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get snapshotDate => $composableBuilder(
    column: $table.snapshotDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get pv => $composableBuilder(
    column: $table.pv,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get ev => $composableBuilder(
    column: $table.ev,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get ac => $composableBuilder(
    column: $table.ac,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get cpi => $composableBuilder(
    column: $table.cpi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get spi => $composableBuilder(
    column: $table.spi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EvmSnapshotsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EvmSnapshotsTable> {
  $$EvmSnapshotsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get snapshotDate => $composableBuilder(
    column: $table.snapshotDate,
    builder: (column) => column,
  );

  GeneratedColumn<double> get pv =>
      $composableBuilder(column: $table.pv, builder: (column) => column);

  GeneratedColumn<double> get ev =>
      $composableBuilder(column: $table.ev, builder: (column) => column);

  GeneratedColumn<double> get ac =>
      $composableBuilder(column: $table.ac, builder: (column) => column);

  GeneratedColumn<double> get cpi =>
      $composableBuilder(column: $table.cpi, builder: (column) => column);

  GeneratedColumn<double> get spi =>
      $composableBuilder(column: $table.spi, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);
}

class $$EvmSnapshotsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EvmSnapshotsTable,
          EvmSnapshot,
          $$EvmSnapshotsTableFilterComposer,
          $$EvmSnapshotsTableOrderingComposer,
          $$EvmSnapshotsTableAnnotationComposer,
          $$EvmSnapshotsTableCreateCompanionBuilder,
          $$EvmSnapshotsTableUpdateCompanionBuilder,
          (
            EvmSnapshot,
            BaseReferences<_$AppDatabase, $EvmSnapshotsTable, EvmSnapshot>,
          ),
          EvmSnapshot,
          PrefetchHooks Function()
        > {
  $$EvmSnapshotsTableTableManager(_$AppDatabase db, $EvmSnapshotsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EvmSnapshotsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EvmSnapshotsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EvmSnapshotsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> snapshotDate = const Value.absent(),
                Value<double> pv = const Value.absent(),
                Value<double> ev = const Value.absent(),
                Value<double> ac = const Value.absent(),
                Value<double> cpi = const Value.absent(),
                Value<double> spi = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => EvmSnapshotsCompanion(
                id: id,
                snapshotDate: snapshotDate,
                pv: pv,
                ev: ev,
                ac: ac,
                cpi: cpi,
                spi: spi,
                note: note,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime snapshotDate,
                required double pv,
                required double ev,
                required double ac,
                required double cpi,
                required double spi,
                Value<String?> note = const Value.absent(),
              }) => EvmSnapshotsCompanion.insert(
                id: id,
                snapshotDate: snapshotDate,
                pv: pv,
                ev: ev,
                ac: ac,
                cpi: cpi,
                spi: spi,
                note: note,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$EvmSnapshotsTable, EvmSnapshot>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $EvmSnapshotsTable,
                    EvmSnapshot
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EvmSnapshotsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EvmSnapshotsTable,
      EvmSnapshot,
      $$EvmSnapshotsTableFilterComposer,
      $$EvmSnapshotsTableOrderingComposer,
      $$EvmSnapshotsTableAnnotationComposer,
      $$EvmSnapshotsTableCreateCompanionBuilder,
      $$EvmSnapshotsTableUpdateCompanionBuilder,
      (
        EvmSnapshot,
        BaseReferences<_$AppDatabase, $EvmSnapshotsTable, EvmSnapshot>,
      ),
      EvmSnapshot,
      PrefetchHooks Function()
    >;
typedef $$DefectsTableCreateCompanionBuilder =
    DefectsCompanion Function({
      Value<int> id,
      Value<int?> activityId,
      Value<String?> moduleName,
      required String description,
      required String severity,
      Value<int?> assignedTo,
      required String status,
      required DateTime reportedAt,
      Value<DateTime?> resolvedAt,
    });
typedef $$DefectsTableUpdateCompanionBuilder =
    DefectsCompanion Function({
      Value<int> id,
      Value<int?> activityId,
      Value<String?> moduleName,
      Value<String> description,
      Value<String> severity,
      Value<int?> assignedTo,
      Value<String> status,
      Value<DateTime> reportedAt,
      Value<DateTime?> resolvedAt,
    });

class $$DefectsTableFilterComposer
    extends Composer<_$AppDatabase, $DefectsTable> {
  $$DefectsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get activityId => $composableBuilder(
    column: $table.activityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get moduleName => $composableBuilder(
    column: $table.moduleName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get severity => $composableBuilder(
    column: $table.severity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get assignedTo => $composableBuilder(
    column: $table.assignedTo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get reportedAt => $composableBuilder(
    column: $table.reportedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get resolvedAt => $composableBuilder(
    column: $table.resolvedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DefectsTableOrderingComposer
    extends Composer<_$AppDatabase, $DefectsTable> {
  $$DefectsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get activityId => $composableBuilder(
    column: $table.activityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get moduleName => $composableBuilder(
    column: $table.moduleName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get severity => $composableBuilder(
    column: $table.severity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get assignedTo => $composableBuilder(
    column: $table.assignedTo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get reportedAt => $composableBuilder(
    column: $table.reportedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get resolvedAt => $composableBuilder(
    column: $table.resolvedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DefectsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DefectsTable> {
  $$DefectsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get activityId => $composableBuilder(
    column: $table.activityId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get moduleName => $composableBuilder(
    column: $table.moduleName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get severity =>
      $composableBuilder(column: $table.severity, builder: (column) => column);

  GeneratedColumn<int> get assignedTo => $composableBuilder(
    column: $table.assignedTo,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get reportedAt => $composableBuilder(
    column: $table.reportedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get resolvedAt => $composableBuilder(
    column: $table.resolvedAt,
    builder: (column) => column,
  );
}

class $$DefectsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DefectsTable,
          Defect,
          $$DefectsTableFilterComposer,
          $$DefectsTableOrderingComposer,
          $$DefectsTableAnnotationComposer,
          $$DefectsTableCreateCompanionBuilder,
          $$DefectsTableUpdateCompanionBuilder,
          (Defect, BaseReferences<_$AppDatabase, $DefectsTable, Defect>),
          Defect,
          PrefetchHooks Function()
        > {
  $$DefectsTableTableManager(_$AppDatabase db, $DefectsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DefectsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DefectsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DefectsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> activityId = const Value.absent(),
                Value<String?> moduleName = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> severity = const Value.absent(),
                Value<int?> assignedTo = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> reportedAt = const Value.absent(),
                Value<DateTime?> resolvedAt = const Value.absent(),
              }) => DefectsCompanion(
                id: id,
                activityId: activityId,
                moduleName: moduleName,
                description: description,
                severity: severity,
                assignedTo: assignedTo,
                status: status,
                reportedAt: reportedAt,
                resolvedAt: resolvedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> activityId = const Value.absent(),
                Value<String?> moduleName = const Value.absent(),
                required String description,
                required String severity,
                Value<int?> assignedTo = const Value.absent(),
                required String status,
                required DateTime reportedAt,
                Value<DateTime?> resolvedAt = const Value.absent(),
              }) => DefectsCompanion.insert(
                id: id,
                activityId: activityId,
                moduleName: moduleName,
                description: description,
                severity: severity,
                assignedTo: assignedTo,
                status: status,
                reportedAt: reportedAt,
                resolvedAt: resolvedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DefectsTable, Defect>(table),
                  BaseReferences<_$AppDatabase, $DefectsTable, Defect>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DefectsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DefectsTable,
      Defect,
      $$DefectsTableFilterComposer,
      $$DefectsTableOrderingComposer,
      $$DefectsTableAnnotationComposer,
      $$DefectsTableCreateCompanionBuilder,
      $$DefectsTableUpdateCompanionBuilder,
      (Defect, BaseReferences<_$AppDatabase, $DefectsTable, Defect>),
      Defect,
      PrefetchHooks Function()
    >;
typedef $$QualityChecklistItemsTableCreateCompanionBuilder =
    QualityChecklistItemsCompanion Function({
      Value<int> id,
      required String deliverable,
      required String criterion,
      required String inspectionResult,
      Value<int?> testedBy,
      Value<DateTime?> testedAt,
    });
typedef $$QualityChecklistItemsTableUpdateCompanionBuilder =
    QualityChecklistItemsCompanion Function({
      Value<int> id,
      Value<String> deliverable,
      Value<String> criterion,
      Value<String> inspectionResult,
      Value<int?> testedBy,
      Value<DateTime?> testedAt,
    });

class $$QualityChecklistItemsTableFilterComposer
    extends Composer<_$AppDatabase, $QualityChecklistItemsTable> {
  $$QualityChecklistItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deliverable => $composableBuilder(
    column: $table.deliverable,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get criterion => $composableBuilder(
    column: $table.criterion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get inspectionResult => $composableBuilder(
    column: $table.inspectionResult,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get testedBy => $composableBuilder(
    column: $table.testedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get testedAt => $composableBuilder(
    column: $table.testedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$QualityChecklistItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $QualityChecklistItemsTable> {
  $$QualityChecklistItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deliverable => $composableBuilder(
    column: $table.deliverable,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get criterion => $composableBuilder(
    column: $table.criterion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get inspectionResult => $composableBuilder(
    column: $table.inspectionResult,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get testedBy => $composableBuilder(
    column: $table.testedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get testedAt => $composableBuilder(
    column: $table.testedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$QualityChecklistItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $QualityChecklistItemsTable> {
  $$QualityChecklistItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get deliverable => $composableBuilder(
    column: $table.deliverable,
    builder: (column) => column,
  );

  GeneratedColumn<String> get criterion =>
      $composableBuilder(column: $table.criterion, builder: (column) => column);

  GeneratedColumn<String> get inspectionResult => $composableBuilder(
    column: $table.inspectionResult,
    builder: (column) => column,
  );

  GeneratedColumn<int> get testedBy =>
      $composableBuilder(column: $table.testedBy, builder: (column) => column);

  GeneratedColumn<DateTime> get testedAt =>
      $composableBuilder(column: $table.testedAt, builder: (column) => column);
}

class $$QualityChecklistItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QualityChecklistItemsTable,
          QualityChecklistItem,
          $$QualityChecklistItemsTableFilterComposer,
          $$QualityChecklistItemsTableOrderingComposer,
          $$QualityChecklistItemsTableAnnotationComposer,
          $$QualityChecklistItemsTableCreateCompanionBuilder,
          $$QualityChecklistItemsTableUpdateCompanionBuilder,
          (
            QualityChecklistItem,
            BaseReferences<
              _$AppDatabase,
              $QualityChecklistItemsTable,
              QualityChecklistItem
            >,
          ),
          QualityChecklistItem,
          PrefetchHooks Function()
        > {
  $$QualityChecklistItemsTableTableManager(
    _$AppDatabase db,
    $QualityChecklistItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QualityChecklistItemsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$QualityChecklistItemsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$QualityChecklistItemsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> deliverable = const Value.absent(),
                Value<String> criterion = const Value.absent(),
                Value<String> inspectionResult = const Value.absent(),
                Value<int?> testedBy = const Value.absent(),
                Value<DateTime?> testedAt = const Value.absent(),
              }) => QualityChecklistItemsCompanion(
                id: id,
                deliverable: deliverable,
                criterion: criterion,
                inspectionResult: inspectionResult,
                testedBy: testedBy,
                testedAt: testedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String deliverable,
                required String criterion,
                required String inspectionResult,
                Value<int?> testedBy = const Value.absent(),
                Value<DateTime?> testedAt = const Value.absent(),
              }) => QualityChecklistItemsCompanion.insert(
                id: id,
                deliverable: deliverable,
                criterion: criterion,
                inspectionResult: inspectionResult,
                testedBy: testedBy,
                testedAt: testedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $QualityChecklistItemsTable,
                    QualityChecklistItem
                  >(table),
                  BaseReferences<
                    _$AppDatabase,
                    $QualityChecklistItemsTable,
                    QualityChecklistItem
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$QualityChecklistItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QualityChecklistItemsTable,
      QualityChecklistItem,
      $$QualityChecklistItemsTableFilterComposer,
      $$QualityChecklistItemsTableOrderingComposer,
      $$QualityChecklistItemsTableAnnotationComposer,
      $$QualityChecklistItemsTableCreateCompanionBuilder,
      $$QualityChecklistItemsTableUpdateCompanionBuilder,
      (
        QualityChecklistItem,
        BaseReferences<
          _$AppDatabase,
          $QualityChecklistItemsTable,
          QualityChecklistItem
        >,
      ),
      QualityChecklistItem,
      PrefetchHooks Function()
    >;
typedef $$RisksTableCreateCompanionBuilder =
    RisksCompanion Function({
      Value<int> id,
      required String title,
      required String description,
      required int likelihood,
      required int impact,
      required int score,
      required String responseType,
      required String preventiveAction,
      required String correctiveAction,
      required String status,
    });
typedef $$RisksTableUpdateCompanionBuilder =
    RisksCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> description,
      Value<int> likelihood,
      Value<int> impact,
      Value<int> score,
      Value<String> responseType,
      Value<String> preventiveAction,
      Value<String> correctiveAction,
      Value<String> status,
    });

class $$RisksTableFilterComposer extends Composer<_$AppDatabase, $RisksTable> {
  $$RisksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get likelihood => $composableBuilder(
    column: $table.likelihood,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get impact => $composableBuilder(
    column: $table.impact,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get responseType => $composableBuilder(
    column: $table.responseType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get preventiveAction => $composableBuilder(
    column: $table.preventiveAction,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get correctiveAction => $composableBuilder(
    column: $table.correctiveAction,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RisksTableOrderingComposer
    extends Composer<_$AppDatabase, $RisksTable> {
  $$RisksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get likelihood => $composableBuilder(
    column: $table.likelihood,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get impact => $composableBuilder(
    column: $table.impact,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get responseType => $composableBuilder(
    column: $table.responseType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get preventiveAction => $composableBuilder(
    column: $table.preventiveAction,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get correctiveAction => $composableBuilder(
    column: $table.correctiveAction,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RisksTableAnnotationComposer
    extends Composer<_$AppDatabase, $RisksTable> {
  $$RisksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get likelihood => $composableBuilder(
    column: $table.likelihood,
    builder: (column) => column,
  );

  GeneratedColumn<int> get impact =>
      $composableBuilder(column: $table.impact, builder: (column) => column);

  GeneratedColumn<int> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  GeneratedColumn<String> get responseType => $composableBuilder(
    column: $table.responseType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get preventiveAction => $composableBuilder(
    column: $table.preventiveAction,
    builder: (column) => column,
  );

  GeneratedColumn<String> get correctiveAction => $composableBuilder(
    column: $table.correctiveAction,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$RisksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RisksTable,
          Risk,
          $$RisksTableFilterComposer,
          $$RisksTableOrderingComposer,
          $$RisksTableAnnotationComposer,
          $$RisksTableCreateCompanionBuilder,
          $$RisksTableUpdateCompanionBuilder,
          (Risk, BaseReferences<_$AppDatabase, $RisksTable, Risk>),
          Risk,
          PrefetchHooks Function()
        > {
  $$RisksTableTableManager(_$AppDatabase db, $RisksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RisksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RisksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RisksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> likelihood = const Value.absent(),
                Value<int> impact = const Value.absent(),
                Value<int> score = const Value.absent(),
                Value<String> responseType = const Value.absent(),
                Value<String> preventiveAction = const Value.absent(),
                Value<String> correctiveAction = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => RisksCompanion(
                id: id,
                title: title,
                description: description,
                likelihood: likelihood,
                impact: impact,
                score: score,
                responseType: responseType,
                preventiveAction: preventiveAction,
                correctiveAction: correctiveAction,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String description,
                required int likelihood,
                required int impact,
                required int score,
                required String responseType,
                required String preventiveAction,
                required String correctiveAction,
                required String status,
              }) => RisksCompanion.insert(
                id: id,
                title: title,
                description: description,
                likelihood: likelihood,
                impact: impact,
                score: score,
                responseType: responseType,
                preventiveAction: preventiveAction,
                correctiveAction: correctiveAction,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$RisksTable, Risk>(table),
                  BaseReferences<_$AppDatabase, $RisksTable, Risk>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RisksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RisksTable,
      Risk,
      $$RisksTableFilterComposer,
      $$RisksTableOrderingComposer,
      $$RisksTableAnnotationComposer,
      $$RisksTableCreateCompanionBuilder,
      $$RisksTableUpdateCompanionBuilder,
      (Risk, BaseReferences<_$AppDatabase, $RisksTable, Risk>),
      Risk,
      PrefetchHooks Function()
    >;
typedef $$AuditLogTableCreateCompanionBuilder =
    AuditLogCompanion Function({
      Value<int> id,
      required String entity,
      required int entityId,
      required String action,
      required DateTime timestamp,
    });
typedef $$AuditLogTableUpdateCompanionBuilder =
    AuditLogCompanion Function({
      Value<int> id,
      Value<String> entity,
      Value<int> entityId,
      Value<String> action,
      Value<DateTime> timestamp,
    });

class $$AuditLogTableFilterComposer
    extends Composer<_$AppDatabase, $AuditLogTable> {
  $$AuditLogTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entity => $composableBuilder(
    column: $table.entity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AuditLogTableOrderingComposer
    extends Composer<_$AppDatabase, $AuditLogTable> {
  $$AuditLogTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entity => $composableBuilder(
    column: $table.entity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AuditLogTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuditLogTable> {
  $$AuditLogTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entity =>
      $composableBuilder(column: $table.entity, builder: (column) => column);

  GeneratedColumn<int> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);
}

class $$AuditLogTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AuditLogTable,
          AuditLogData,
          $$AuditLogTableFilterComposer,
          $$AuditLogTableOrderingComposer,
          $$AuditLogTableAnnotationComposer,
          $$AuditLogTableCreateCompanionBuilder,
          $$AuditLogTableUpdateCompanionBuilder,
          (
            AuditLogData,
            BaseReferences<_$AppDatabase, $AuditLogTable, AuditLogData>,
          ),
          AuditLogData,
          PrefetchHooks Function()
        > {
  $$AuditLogTableTableManager(_$AppDatabase db, $AuditLogTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuditLogTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuditLogTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuditLogTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> entity = const Value.absent(),
                Value<int> entityId = const Value.absent(),
                Value<String> action = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
              }) => AuditLogCompanion(
                id: id,
                entity: entity,
                entityId: entityId,
                action: action,
                timestamp: timestamp,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String entity,
                required int entityId,
                required String action,
                required DateTime timestamp,
              }) => AuditLogCompanion.insert(
                id: id,
                entity: entity,
                entityId: entityId,
                action: action,
                timestamp: timestamp,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AuditLogTable, AuditLogData>(table),
                  BaseReferences<_$AppDatabase, $AuditLogTable, AuditLogData>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AuditLogTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AuditLogTable,
      AuditLogData,
      $$AuditLogTableFilterComposer,
      $$AuditLogTableOrderingComposer,
      $$AuditLogTableAnnotationComposer,
      $$AuditLogTableCreateCompanionBuilder,
      $$AuditLogTableUpdateCompanionBuilder,
      (
        AuditLogData,
        BaseReferences<_$AppDatabase, $AuditLogTable, AuditLogData>,
      ),
      AuditLogData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProjectCharterTableTableManager get projectCharter =>
      $$ProjectCharterTableTableManager(_db, _db.projectCharter);
  $$StakeholdersTableTableManager get stakeholders =>
      $$StakeholdersTableTableManager(_db, _db.stakeholders);
  $$RequirementsTableTableManager get requirements =>
      $$RequirementsTableTableManager(_db, _db.requirements);
  $$WbsNodesTableTableManager get wbsNodes =>
      $$WbsNodesTableTableManager(_db, _db.wbsNodes);
  $$ChangeRequestsTableTableManager get changeRequests =>
      $$ChangeRequestsTableTableManager(_db, _db.changeRequests);
  $$ActivitiesTableTableManager get activities =>
      $$ActivitiesTableTableManager(_db, _db.activities);
  $$ActivityDependenciesTableTableManager get activityDependencies =>
      $$ActivityDependenciesTableTableManager(_db, _db.activityDependencies);
  $$TeamMembersTableTableManager get teamMembers =>
      $$TeamMembersTableTableManager(_db, _db.teamMembers);
  $$ActivityCostsTableTableManager get activityCosts =>
      $$ActivityCostsTableTableManager(_db, _db.activityCosts);
  $$EvmSnapshotsTableTableManager get evmSnapshots =>
      $$EvmSnapshotsTableTableManager(_db, _db.evmSnapshots);
  $$DefectsTableTableManager get defects =>
      $$DefectsTableTableManager(_db, _db.defects);
  $$QualityChecklistItemsTableTableManager get qualityChecklistItems =>
      $$QualityChecklistItemsTableTableManager(_db, _db.qualityChecklistItems);
  $$RisksTableTableManager get risks =>
      $$RisksTableTableManager(_db, _db.risks);
  $$AuditLogTableTableManager get auditLog =>
      $$AuditLogTableTableManager(_db, _db.auditLog);
}
