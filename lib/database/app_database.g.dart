// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $FavoriteRecipesTable extends FavoriteRecipes
    with TableInfo<$FavoriteRecipesTable, FavoriteRecipe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteRecipesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMealMeta = const VerificationMeta('idMeal');
  @override
  late final GeneratedColumn<String> idMeal = GeneratedColumn<String>(
      'id_meal', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _strMealMeta =
      const VerificationMeta('strMeal');
  @override
  late final GeneratedColumn<String> strMeal = GeneratedColumn<String>(
      'str_meal', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _strMealThumbMeta =
      const VerificationMeta('strMealThumb');
  @override
  late final GeneratedColumn<String> strMealThumb = GeneratedColumn<String>(
      'str_meal_thumb', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _strInstructionsMeta =
      const VerificationMeta('strInstructions');
  @override
  late final GeneratedColumn<String> strInstructions = GeneratedColumn<String>(
      'str_instructions', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _strSourceMeta =
      const VerificationMeta('strSource');
  @override
  late final GeneratedColumn<String> strSource = GeneratedColumn<String>(
      'str_source', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _strCategoryMeta =
      const VerificationMeta('strCategory');
  @override
  late final GeneratedColumn<String> strCategory = GeneratedColumn<String>(
      'str_category', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _strAreaMeta =
      const VerificationMeta('strArea');
  @override
  late final GeneratedColumn<String> strArea = GeneratedColumn<String>(
      'str_area', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _strYoutubeMeta =
      const VerificationMeta('strYoutube');
  @override
  late final GeneratedColumn<String> strYoutube = GeneratedColumn<String>(
      'str_youtube', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ingredientsJsonMeta =
      const VerificationMeta('ingredientsJson');
  @override
  late final GeneratedColumn<String> ingredientsJson = GeneratedColumn<String>(
      'ingredients_json', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        idMeal,
        strMeal,
        strMealThumb,
        strInstructions,
        strSource,
        strCategory,
        strArea,
        strYoutube,
        ingredientsJson
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_recipes';
  @override
  VerificationContext validateIntegrity(Insertable<FavoriteRecipe> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_meal')) {
      context.handle(_idMealMeta,
          idMeal.isAcceptableOrUnknown(data['id_meal']!, _idMealMeta));
    } else if (isInserting) {
      context.missing(_idMealMeta);
    }
    if (data.containsKey('str_meal')) {
      context.handle(_strMealMeta,
          strMeal.isAcceptableOrUnknown(data['str_meal']!, _strMealMeta));
    } else if (isInserting) {
      context.missing(_strMealMeta);
    }
    if (data.containsKey('str_meal_thumb')) {
      context.handle(
          _strMealThumbMeta,
          strMealThumb.isAcceptableOrUnknown(
              data['str_meal_thumb']!, _strMealThumbMeta));
    }
    if (data.containsKey('str_instructions')) {
      context.handle(
          _strInstructionsMeta,
          strInstructions.isAcceptableOrUnknown(
              data['str_instructions']!, _strInstructionsMeta));
    }
    if (data.containsKey('str_source')) {
      context.handle(_strSourceMeta,
          strSource.isAcceptableOrUnknown(data['str_source']!, _strSourceMeta));
    }
    if (data.containsKey('str_category')) {
      context.handle(
          _strCategoryMeta,
          strCategory.isAcceptableOrUnknown(
              data['str_category']!, _strCategoryMeta));
    }
    if (data.containsKey('str_area')) {
      context.handle(_strAreaMeta,
          strArea.isAcceptableOrUnknown(data['str_area']!, _strAreaMeta));
    }
    if (data.containsKey('str_youtube')) {
      context.handle(
          _strYoutubeMeta,
          strYoutube.isAcceptableOrUnknown(
              data['str_youtube']!, _strYoutubeMeta));
    }
    if (data.containsKey('ingredients_json')) {
      context.handle(
          _ingredientsJsonMeta,
          ingredientsJson.isAcceptableOrUnknown(
              data['ingredients_json']!, _ingredientsJsonMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idMeal};
  @override
  FavoriteRecipe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteRecipe(
      idMeal: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id_meal'])!,
      strMeal: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}str_meal'])!,
      strMealThumb: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}str_meal_thumb']),
      strInstructions: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}str_instructions']),
      strSource: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}str_source']),
      strCategory: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}str_category']),
      strArea: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}str_area']),
      strYoutube: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}str_youtube']),
      ingredientsJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}ingredients_json']),
    );
  }

  @override
  $FavoriteRecipesTable createAlias(String alias) {
    return $FavoriteRecipesTable(attachedDatabase, alias);
  }
}

class FavoriteRecipe extends DataClass implements Insertable<FavoriteRecipe> {
  final String idMeal;
  final String strMeal;
  final String? strMealThumb;
  final String? strInstructions;
  final String? strSource;
  final String? strCategory;
  final String? strArea;
  final String? strYoutube;
  final String? ingredientsJson;
  const FavoriteRecipe(
      {required this.idMeal,
      required this.strMeal,
      this.strMealThumb,
      this.strInstructions,
      this.strSource,
      this.strCategory,
      this.strArea,
      this.strYoutube,
      this.ingredientsJson});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_meal'] = Variable<String>(idMeal);
    map['str_meal'] = Variable<String>(strMeal);
    if (!nullToAbsent || strMealThumb != null) {
      map['str_meal_thumb'] = Variable<String>(strMealThumb);
    }
    if (!nullToAbsent || strInstructions != null) {
      map['str_instructions'] = Variable<String>(strInstructions);
    }
    if (!nullToAbsent || strSource != null) {
      map['str_source'] = Variable<String>(strSource);
    }
    if (!nullToAbsent || strCategory != null) {
      map['str_category'] = Variable<String>(strCategory);
    }
    if (!nullToAbsent || strArea != null) {
      map['str_area'] = Variable<String>(strArea);
    }
    if (!nullToAbsent || strYoutube != null) {
      map['str_youtube'] = Variable<String>(strYoutube);
    }
    if (!nullToAbsent || ingredientsJson != null) {
      map['ingredients_json'] = Variable<String>(ingredientsJson);
    }
    return map;
  }

  FavoriteRecipesCompanion toCompanion(bool nullToAbsent) {
    return FavoriteRecipesCompanion(
      idMeal: Value(idMeal),
      strMeal: Value(strMeal),
      strMealThumb: strMealThumb == null && nullToAbsent
          ? const Value.absent()
          : Value(strMealThumb),
      strInstructions: strInstructions == null && nullToAbsent
          ? const Value.absent()
          : Value(strInstructions),
      strSource: strSource == null && nullToAbsent
          ? const Value.absent()
          : Value(strSource),
      strCategory: strCategory == null && nullToAbsent
          ? const Value.absent()
          : Value(strCategory),
      strArea: strArea == null && nullToAbsent
          ? const Value.absent()
          : Value(strArea),
      strYoutube: strYoutube == null && nullToAbsent
          ? const Value.absent()
          : Value(strYoutube),
      ingredientsJson: ingredientsJson == null && nullToAbsent
          ? const Value.absent()
          : Value(ingredientsJson),
    );
  }

  factory FavoriteRecipe.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteRecipe(
      idMeal: serializer.fromJson<String>(json['idMeal']),
      strMeal: serializer.fromJson<String>(json['strMeal']),
      strMealThumb: serializer.fromJson<String?>(json['strMealThumb']),
      strInstructions: serializer.fromJson<String?>(json['strInstructions']),
      strSource: serializer.fromJson<String?>(json['strSource']),
      strCategory: serializer.fromJson<String?>(json['strCategory']),
      strArea: serializer.fromJson<String?>(json['strArea']),
      strYoutube: serializer.fromJson<String?>(json['strYoutube']),
      ingredientsJson: serializer.fromJson<String?>(json['ingredientsJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idMeal': serializer.toJson<String>(idMeal),
      'strMeal': serializer.toJson<String>(strMeal),
      'strMealThumb': serializer.toJson<String?>(strMealThumb),
      'strInstructions': serializer.toJson<String?>(strInstructions),
      'strSource': serializer.toJson<String?>(strSource),
      'strCategory': serializer.toJson<String?>(strCategory),
      'strArea': serializer.toJson<String?>(strArea),
      'strYoutube': serializer.toJson<String?>(strYoutube),
      'ingredientsJson': serializer.toJson<String?>(ingredientsJson),
    };
  }

  FavoriteRecipe copyWith(
          {String? idMeal,
          String? strMeal,
          Value<String?> strMealThumb = const Value.absent(),
          Value<String?> strInstructions = const Value.absent(),
          Value<String?> strSource = const Value.absent(),
          Value<String?> strCategory = const Value.absent(),
          Value<String?> strArea = const Value.absent(),
          Value<String?> strYoutube = const Value.absent(),
          Value<String?> ingredientsJson = const Value.absent()}) =>
      FavoriteRecipe(
        idMeal: idMeal ?? this.idMeal,
        strMeal: strMeal ?? this.strMeal,
        strMealThumb:
            strMealThumb.present ? strMealThumb.value : this.strMealThumb,
        strInstructions: strInstructions.present
            ? strInstructions.value
            : this.strInstructions,
        strSource: strSource.present ? strSource.value : this.strSource,
        strCategory: strCategory.present ? strCategory.value : this.strCategory,
        strArea: strArea.present ? strArea.value : this.strArea,
        strYoutube: strYoutube.present ? strYoutube.value : this.strYoutube,
        ingredientsJson: ingredientsJson.present
            ? ingredientsJson.value
            : this.ingredientsJson,
      );
  FavoriteRecipe copyWithCompanion(FavoriteRecipesCompanion data) {
    return FavoriteRecipe(
      idMeal: data.idMeal.present ? data.idMeal.value : this.idMeal,
      strMeal: data.strMeal.present ? data.strMeal.value : this.strMeal,
      strMealThumb: data.strMealThumb.present
          ? data.strMealThumb.value
          : this.strMealThumb,
      strInstructions: data.strInstructions.present
          ? data.strInstructions.value
          : this.strInstructions,
      strSource: data.strSource.present ? data.strSource.value : this.strSource,
      strCategory:
          data.strCategory.present ? data.strCategory.value : this.strCategory,
      strArea: data.strArea.present ? data.strArea.value : this.strArea,
      strYoutube:
          data.strYoutube.present ? data.strYoutube.value : this.strYoutube,
      ingredientsJson: data.ingredientsJson.present
          ? data.ingredientsJson.value
          : this.ingredientsJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteRecipe(')
          ..write('idMeal: $idMeal, ')
          ..write('strMeal: $strMeal, ')
          ..write('strMealThumb: $strMealThumb, ')
          ..write('strInstructions: $strInstructions, ')
          ..write('strSource: $strSource, ')
          ..write('strCategory: $strCategory, ')
          ..write('strArea: $strArea, ')
          ..write('strYoutube: $strYoutube, ')
          ..write('ingredientsJson: $ingredientsJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      idMeal,
      strMeal,
      strMealThumb,
      strInstructions,
      strSource,
      strCategory,
      strArea,
      strYoutube,
      ingredientsJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteRecipe &&
          other.idMeal == this.idMeal &&
          other.strMeal == this.strMeal &&
          other.strMealThumb == this.strMealThumb &&
          other.strInstructions == this.strInstructions &&
          other.strSource == this.strSource &&
          other.strCategory == this.strCategory &&
          other.strArea == this.strArea &&
          other.strYoutube == this.strYoutube &&
          other.ingredientsJson == this.ingredientsJson);
}

class FavoriteRecipesCompanion extends UpdateCompanion<FavoriteRecipe> {
  final Value<String> idMeal;
  final Value<String> strMeal;
  final Value<String?> strMealThumb;
  final Value<String?> strInstructions;
  final Value<String?> strSource;
  final Value<String?> strCategory;
  final Value<String?> strArea;
  final Value<String?> strYoutube;
  final Value<String?> ingredientsJson;
  final Value<int> rowid;
  const FavoriteRecipesCompanion({
    this.idMeal = const Value.absent(),
    this.strMeal = const Value.absent(),
    this.strMealThumb = const Value.absent(),
    this.strInstructions = const Value.absent(),
    this.strSource = const Value.absent(),
    this.strCategory = const Value.absent(),
    this.strArea = const Value.absent(),
    this.strYoutube = const Value.absent(),
    this.ingredientsJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FavoriteRecipesCompanion.insert({
    required String idMeal,
    required String strMeal,
    this.strMealThumb = const Value.absent(),
    this.strInstructions = const Value.absent(),
    this.strSource = const Value.absent(),
    this.strCategory = const Value.absent(),
    this.strArea = const Value.absent(),
    this.strYoutube = const Value.absent(),
    this.ingredientsJson = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : idMeal = Value(idMeal),
        strMeal = Value(strMeal);
  static Insertable<FavoriteRecipe> custom({
    Expression<String>? idMeal,
    Expression<String>? strMeal,
    Expression<String>? strMealThumb,
    Expression<String>? strInstructions,
    Expression<String>? strSource,
    Expression<String>? strCategory,
    Expression<String>? strArea,
    Expression<String>? strYoutube,
    Expression<String>? ingredientsJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idMeal != null) 'id_meal': idMeal,
      if (strMeal != null) 'str_meal': strMeal,
      if (strMealThumb != null) 'str_meal_thumb': strMealThumb,
      if (strInstructions != null) 'str_instructions': strInstructions,
      if (strSource != null) 'str_source': strSource,
      if (strCategory != null) 'str_category': strCategory,
      if (strArea != null) 'str_area': strArea,
      if (strYoutube != null) 'str_youtube': strYoutube,
      if (ingredientsJson != null) 'ingredients_json': ingredientsJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FavoriteRecipesCompanion copyWith(
      {Value<String>? idMeal,
      Value<String>? strMeal,
      Value<String?>? strMealThumb,
      Value<String?>? strInstructions,
      Value<String?>? strSource,
      Value<String?>? strCategory,
      Value<String?>? strArea,
      Value<String?>? strYoutube,
      Value<String?>? ingredientsJson,
      Value<int>? rowid}) {
    return FavoriteRecipesCompanion(
      idMeal: idMeal ?? this.idMeal,
      strMeal: strMeal ?? this.strMeal,
      strMealThumb: strMealThumb ?? this.strMealThumb,
      strInstructions: strInstructions ?? this.strInstructions,
      strSource: strSource ?? this.strSource,
      strCategory: strCategory ?? this.strCategory,
      strArea: strArea ?? this.strArea,
      strYoutube: strYoutube ?? this.strYoutube,
      ingredientsJson: ingredientsJson ?? this.ingredientsJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idMeal.present) {
      map['id_meal'] = Variable<String>(idMeal.value);
    }
    if (strMeal.present) {
      map['str_meal'] = Variable<String>(strMeal.value);
    }
    if (strMealThumb.present) {
      map['str_meal_thumb'] = Variable<String>(strMealThumb.value);
    }
    if (strInstructions.present) {
      map['str_instructions'] = Variable<String>(strInstructions.value);
    }
    if (strSource.present) {
      map['str_source'] = Variable<String>(strSource.value);
    }
    if (strCategory.present) {
      map['str_category'] = Variable<String>(strCategory.value);
    }
    if (strArea.present) {
      map['str_area'] = Variable<String>(strArea.value);
    }
    if (strYoutube.present) {
      map['str_youtube'] = Variable<String>(strYoutube.value);
    }
    if (ingredientsJson.present) {
      map['ingredients_json'] = Variable<String>(ingredientsJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteRecipesCompanion(')
          ..write('idMeal: $idMeal, ')
          ..write('strMeal: $strMeal, ')
          ..write('strMealThumb: $strMealThumb, ')
          ..write('strInstructions: $strInstructions, ')
          ..write('strSource: $strSource, ')
          ..write('strCategory: $strCategory, ')
          ..write('strArea: $strArea, ')
          ..write('strYoutube: $strYoutube, ')
          ..write('ingredientsJson: $ingredientsJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedRecipesTable extends CachedRecipes
    with TableInfo<$CachedRecipesTable, CachedRecipe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedRecipesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMealMeta = const VerificationMeta('idMeal');
  @override
  late final GeneratedColumn<String> idMeal = GeneratedColumn<String>(
      'id_meal', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _strMealMeta =
      const VerificationMeta('strMeal');
  @override
  late final GeneratedColumn<String> strMeal = GeneratedColumn<String>(
      'str_meal', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _strMealThumbMeta =
      const VerificationMeta('strMealThumb');
  @override
  late final GeneratedColumn<String> strMealThumb = GeneratedColumn<String>(
      'str_meal_thumb', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _strInstructionsMeta =
      const VerificationMeta('strInstructions');
  @override
  late final GeneratedColumn<String> strInstructions = GeneratedColumn<String>(
      'str_instructions', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _strSourceMeta =
      const VerificationMeta('strSource');
  @override
  late final GeneratedColumn<String> strSource = GeneratedColumn<String>(
      'str_source', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _strCategoryMeta =
      const VerificationMeta('strCategory');
  @override
  late final GeneratedColumn<String> strCategory = GeneratedColumn<String>(
      'str_category', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _strAreaMeta =
      const VerificationMeta('strArea');
  @override
  late final GeneratedColumn<String> strArea = GeneratedColumn<String>(
      'str_area', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _strYoutubeMeta =
      const VerificationMeta('strYoutube');
  @override
  late final GeneratedColumn<String> strYoutube = GeneratedColumn<String>(
      'str_youtube', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ingredientsJsonMeta =
      const VerificationMeta('ingredientsJson');
  @override
  late final GeneratedColumn<String> ingredientsJson = GeneratedColumn<String>(
      'ingredients_json', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _viewedAtMeta =
      const VerificationMeta('viewedAt');
  @override
  late final GeneratedColumn<int> viewedAt = GeneratedColumn<int>(
      'viewed_at', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        idMeal,
        strMeal,
        strMealThumb,
        strInstructions,
        strSource,
        strCategory,
        strArea,
        strYoutube,
        ingredientsJson,
        viewedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_recipes';
  @override
  VerificationContext validateIntegrity(Insertable<CachedRecipe> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_meal')) {
      context.handle(_idMealMeta,
          idMeal.isAcceptableOrUnknown(data['id_meal']!, _idMealMeta));
    } else if (isInserting) {
      context.missing(_idMealMeta);
    }
    if (data.containsKey('str_meal')) {
      context.handle(_strMealMeta,
          strMeal.isAcceptableOrUnknown(data['str_meal']!, _strMealMeta));
    } else if (isInserting) {
      context.missing(_strMealMeta);
    }
    if (data.containsKey('str_meal_thumb')) {
      context.handle(
          _strMealThumbMeta,
          strMealThumb.isAcceptableOrUnknown(
              data['str_meal_thumb']!, _strMealThumbMeta));
    }
    if (data.containsKey('str_instructions')) {
      context.handle(
          _strInstructionsMeta,
          strInstructions.isAcceptableOrUnknown(
              data['str_instructions']!, _strInstructionsMeta));
    }
    if (data.containsKey('str_source')) {
      context.handle(_strSourceMeta,
          strSource.isAcceptableOrUnknown(data['str_source']!, _strSourceMeta));
    }
    if (data.containsKey('str_category')) {
      context.handle(
          _strCategoryMeta,
          strCategory.isAcceptableOrUnknown(
              data['str_category']!, _strCategoryMeta));
    }
    if (data.containsKey('str_area')) {
      context.handle(_strAreaMeta,
          strArea.isAcceptableOrUnknown(data['str_area']!, _strAreaMeta));
    }
    if (data.containsKey('str_youtube')) {
      context.handle(
          _strYoutubeMeta,
          strYoutube.isAcceptableOrUnknown(
              data['str_youtube']!, _strYoutubeMeta));
    }
    if (data.containsKey('ingredients_json')) {
      context.handle(
          _ingredientsJsonMeta,
          ingredientsJson.isAcceptableOrUnknown(
              data['ingredients_json']!, _ingredientsJsonMeta));
    }
    if (data.containsKey('viewed_at')) {
      context.handle(_viewedAtMeta,
          viewedAt.isAcceptableOrUnknown(data['viewed_at']!, _viewedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idMeal};
  @override
  CachedRecipe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedRecipe(
      idMeal: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id_meal'])!,
      strMeal: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}str_meal'])!,
      strMealThumb: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}str_meal_thumb']),
      strInstructions: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}str_instructions']),
      strSource: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}str_source']),
      strCategory: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}str_category']),
      strArea: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}str_area']),
      strYoutube: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}str_youtube']),
      ingredientsJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}ingredients_json']),
      viewedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}viewed_at']),
    );
  }

  @override
  $CachedRecipesTable createAlias(String alias) {
    return $CachedRecipesTable(attachedDatabase, alias);
  }
}

class CachedRecipe extends DataClass implements Insertable<CachedRecipe> {
  final String idMeal;
  final String strMeal;
  final String? strMealThumb;
  final String? strInstructions;
  final String? strSource;
  final String? strCategory;
  final String? strArea;
  final String? strYoutube;
  final String? ingredientsJson;
  final int? viewedAt;
  const CachedRecipe(
      {required this.idMeal,
      required this.strMeal,
      this.strMealThumb,
      this.strInstructions,
      this.strSource,
      this.strCategory,
      this.strArea,
      this.strYoutube,
      this.ingredientsJson,
      this.viewedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_meal'] = Variable<String>(idMeal);
    map['str_meal'] = Variable<String>(strMeal);
    if (!nullToAbsent || strMealThumb != null) {
      map['str_meal_thumb'] = Variable<String>(strMealThumb);
    }
    if (!nullToAbsent || strInstructions != null) {
      map['str_instructions'] = Variable<String>(strInstructions);
    }
    if (!nullToAbsent || strSource != null) {
      map['str_source'] = Variable<String>(strSource);
    }
    if (!nullToAbsent || strCategory != null) {
      map['str_category'] = Variable<String>(strCategory);
    }
    if (!nullToAbsent || strArea != null) {
      map['str_area'] = Variable<String>(strArea);
    }
    if (!nullToAbsent || strYoutube != null) {
      map['str_youtube'] = Variable<String>(strYoutube);
    }
    if (!nullToAbsent || ingredientsJson != null) {
      map['ingredients_json'] = Variable<String>(ingredientsJson);
    }
    if (!nullToAbsent || viewedAt != null) {
      map['viewed_at'] = Variable<int>(viewedAt);
    }
    return map;
  }

  CachedRecipesCompanion toCompanion(bool nullToAbsent) {
    return CachedRecipesCompanion(
      idMeal: Value(idMeal),
      strMeal: Value(strMeal),
      strMealThumb: strMealThumb == null && nullToAbsent
          ? const Value.absent()
          : Value(strMealThumb),
      strInstructions: strInstructions == null && nullToAbsent
          ? const Value.absent()
          : Value(strInstructions),
      strSource: strSource == null && nullToAbsent
          ? const Value.absent()
          : Value(strSource),
      strCategory: strCategory == null && nullToAbsent
          ? const Value.absent()
          : Value(strCategory),
      strArea: strArea == null && nullToAbsent
          ? const Value.absent()
          : Value(strArea),
      strYoutube: strYoutube == null && nullToAbsent
          ? const Value.absent()
          : Value(strYoutube),
      ingredientsJson: ingredientsJson == null && nullToAbsent
          ? const Value.absent()
          : Value(ingredientsJson),
      viewedAt: viewedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(viewedAt),
    );
  }

  factory CachedRecipe.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedRecipe(
      idMeal: serializer.fromJson<String>(json['idMeal']),
      strMeal: serializer.fromJson<String>(json['strMeal']),
      strMealThumb: serializer.fromJson<String?>(json['strMealThumb']),
      strInstructions: serializer.fromJson<String?>(json['strInstructions']),
      strSource: serializer.fromJson<String?>(json['strSource']),
      strCategory: serializer.fromJson<String?>(json['strCategory']),
      strArea: serializer.fromJson<String?>(json['strArea']),
      strYoutube: serializer.fromJson<String?>(json['strYoutube']),
      ingredientsJson: serializer.fromJson<String?>(json['ingredientsJson']),
      viewedAt: serializer.fromJson<int?>(json['viewedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idMeal': serializer.toJson<String>(idMeal),
      'strMeal': serializer.toJson<String>(strMeal),
      'strMealThumb': serializer.toJson<String?>(strMealThumb),
      'strInstructions': serializer.toJson<String?>(strInstructions),
      'strSource': serializer.toJson<String?>(strSource),
      'strCategory': serializer.toJson<String?>(strCategory),
      'strArea': serializer.toJson<String?>(strArea),
      'strYoutube': serializer.toJson<String?>(strYoutube),
      'ingredientsJson': serializer.toJson<String?>(ingredientsJson),
      'viewedAt': serializer.toJson<int?>(viewedAt),
    };
  }

  CachedRecipe copyWith(
          {String? idMeal,
          String? strMeal,
          Value<String?> strMealThumb = const Value.absent(),
          Value<String?> strInstructions = const Value.absent(),
          Value<String?> strSource = const Value.absent(),
          Value<String?> strCategory = const Value.absent(),
          Value<String?> strArea = const Value.absent(),
          Value<String?> strYoutube = const Value.absent(),
          Value<String?> ingredientsJson = const Value.absent(),
          Value<int?> viewedAt = const Value.absent()}) =>
      CachedRecipe(
        idMeal: idMeal ?? this.idMeal,
        strMeal: strMeal ?? this.strMeal,
        strMealThumb:
            strMealThumb.present ? strMealThumb.value : this.strMealThumb,
        strInstructions: strInstructions.present
            ? strInstructions.value
            : this.strInstructions,
        strSource: strSource.present ? strSource.value : this.strSource,
        strCategory: strCategory.present ? strCategory.value : this.strCategory,
        strArea: strArea.present ? strArea.value : this.strArea,
        strYoutube: strYoutube.present ? strYoutube.value : this.strYoutube,
        ingredientsJson: ingredientsJson.present
            ? ingredientsJson.value
            : this.ingredientsJson,
        viewedAt: viewedAt.present ? viewedAt.value : this.viewedAt,
      );
  CachedRecipe copyWithCompanion(CachedRecipesCompanion data) {
    return CachedRecipe(
      idMeal: data.idMeal.present ? data.idMeal.value : this.idMeal,
      strMeal: data.strMeal.present ? data.strMeal.value : this.strMeal,
      strMealThumb: data.strMealThumb.present
          ? data.strMealThumb.value
          : this.strMealThumb,
      strInstructions: data.strInstructions.present
          ? data.strInstructions.value
          : this.strInstructions,
      strSource: data.strSource.present ? data.strSource.value : this.strSource,
      strCategory:
          data.strCategory.present ? data.strCategory.value : this.strCategory,
      strArea: data.strArea.present ? data.strArea.value : this.strArea,
      strYoutube:
          data.strYoutube.present ? data.strYoutube.value : this.strYoutube,
      ingredientsJson: data.ingredientsJson.present
          ? data.ingredientsJson.value
          : this.ingredientsJson,
      viewedAt: data.viewedAt.present ? data.viewedAt.value : this.viewedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedRecipe(')
          ..write('idMeal: $idMeal, ')
          ..write('strMeal: $strMeal, ')
          ..write('strMealThumb: $strMealThumb, ')
          ..write('strInstructions: $strInstructions, ')
          ..write('strSource: $strSource, ')
          ..write('strCategory: $strCategory, ')
          ..write('strArea: $strArea, ')
          ..write('strYoutube: $strYoutube, ')
          ..write('ingredientsJson: $ingredientsJson, ')
          ..write('viewedAt: $viewedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      idMeal,
      strMeal,
      strMealThumb,
      strInstructions,
      strSource,
      strCategory,
      strArea,
      strYoutube,
      ingredientsJson,
      viewedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedRecipe &&
          other.idMeal == this.idMeal &&
          other.strMeal == this.strMeal &&
          other.strMealThumb == this.strMealThumb &&
          other.strInstructions == this.strInstructions &&
          other.strSource == this.strSource &&
          other.strCategory == this.strCategory &&
          other.strArea == this.strArea &&
          other.strYoutube == this.strYoutube &&
          other.ingredientsJson == this.ingredientsJson &&
          other.viewedAt == this.viewedAt);
}

class CachedRecipesCompanion extends UpdateCompanion<CachedRecipe> {
  final Value<String> idMeal;
  final Value<String> strMeal;
  final Value<String?> strMealThumb;
  final Value<String?> strInstructions;
  final Value<String?> strSource;
  final Value<String?> strCategory;
  final Value<String?> strArea;
  final Value<String?> strYoutube;
  final Value<String?> ingredientsJson;
  final Value<int?> viewedAt;
  final Value<int> rowid;
  const CachedRecipesCompanion({
    this.idMeal = const Value.absent(),
    this.strMeal = const Value.absent(),
    this.strMealThumb = const Value.absent(),
    this.strInstructions = const Value.absent(),
    this.strSource = const Value.absent(),
    this.strCategory = const Value.absent(),
    this.strArea = const Value.absent(),
    this.strYoutube = const Value.absent(),
    this.ingredientsJson = const Value.absent(),
    this.viewedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedRecipesCompanion.insert({
    required String idMeal,
    required String strMeal,
    this.strMealThumb = const Value.absent(),
    this.strInstructions = const Value.absent(),
    this.strSource = const Value.absent(),
    this.strCategory = const Value.absent(),
    this.strArea = const Value.absent(),
    this.strYoutube = const Value.absent(),
    this.ingredientsJson = const Value.absent(),
    this.viewedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : idMeal = Value(idMeal),
        strMeal = Value(strMeal);
  static Insertable<CachedRecipe> custom({
    Expression<String>? idMeal,
    Expression<String>? strMeal,
    Expression<String>? strMealThumb,
    Expression<String>? strInstructions,
    Expression<String>? strSource,
    Expression<String>? strCategory,
    Expression<String>? strArea,
    Expression<String>? strYoutube,
    Expression<String>? ingredientsJson,
    Expression<int>? viewedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idMeal != null) 'id_meal': idMeal,
      if (strMeal != null) 'str_meal': strMeal,
      if (strMealThumb != null) 'str_meal_thumb': strMealThumb,
      if (strInstructions != null) 'str_instructions': strInstructions,
      if (strSource != null) 'str_source': strSource,
      if (strCategory != null) 'str_category': strCategory,
      if (strArea != null) 'str_area': strArea,
      if (strYoutube != null) 'str_youtube': strYoutube,
      if (ingredientsJson != null) 'ingredients_json': ingredientsJson,
      if (viewedAt != null) 'viewed_at': viewedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedRecipesCompanion copyWith(
      {Value<String>? idMeal,
      Value<String>? strMeal,
      Value<String?>? strMealThumb,
      Value<String?>? strInstructions,
      Value<String?>? strSource,
      Value<String?>? strCategory,
      Value<String?>? strArea,
      Value<String?>? strYoutube,
      Value<String?>? ingredientsJson,
      Value<int?>? viewedAt,
      Value<int>? rowid}) {
    return CachedRecipesCompanion(
      idMeal: idMeal ?? this.idMeal,
      strMeal: strMeal ?? this.strMeal,
      strMealThumb: strMealThumb ?? this.strMealThumb,
      strInstructions: strInstructions ?? this.strInstructions,
      strSource: strSource ?? this.strSource,
      strCategory: strCategory ?? this.strCategory,
      strArea: strArea ?? this.strArea,
      strYoutube: strYoutube ?? this.strYoutube,
      ingredientsJson: ingredientsJson ?? this.ingredientsJson,
      viewedAt: viewedAt ?? this.viewedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idMeal.present) {
      map['id_meal'] = Variable<String>(idMeal.value);
    }
    if (strMeal.present) {
      map['str_meal'] = Variable<String>(strMeal.value);
    }
    if (strMealThumb.present) {
      map['str_meal_thumb'] = Variable<String>(strMealThumb.value);
    }
    if (strInstructions.present) {
      map['str_instructions'] = Variable<String>(strInstructions.value);
    }
    if (strSource.present) {
      map['str_source'] = Variable<String>(strSource.value);
    }
    if (strCategory.present) {
      map['str_category'] = Variable<String>(strCategory.value);
    }
    if (strArea.present) {
      map['str_area'] = Variable<String>(strArea.value);
    }
    if (strYoutube.present) {
      map['str_youtube'] = Variable<String>(strYoutube.value);
    }
    if (ingredientsJson.present) {
      map['ingredients_json'] = Variable<String>(ingredientsJson.value);
    }
    if (viewedAt.present) {
      map['viewed_at'] = Variable<int>(viewedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedRecipesCompanion(')
          ..write('idMeal: $idMeal, ')
          ..write('strMeal: $strMeal, ')
          ..write('strMealThumb: $strMealThumb, ')
          ..write('strInstructions: $strInstructions, ')
          ..write('strSource: $strSource, ')
          ..write('strCategory: $strCategory, ')
          ..write('strArea: $strArea, ')
          ..write('strYoutube: $strYoutube, ')
          ..write('ingredientsJson: $ingredientsJson, ')
          ..write('viewedAt: $viewedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WidgetCategoriesTable extends WidgetCategories
    with TableInfo<$WidgetCategoriesTable, WidgetCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WidgetCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _recipeIdMeta =
      const VerificationMeta('recipeId');
  @override
  late final GeneratedColumn<String> recipeId = GeneratedColumn<String>(
      'recipe_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [name, imageUrl, recipeId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'widget_categories';
  @override
  VerificationContext validateIntegrity(Insertable<WidgetCategory> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('recipe_id')) {
      context.handle(_recipeIdMeta,
          recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta));
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  WidgetCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WidgetCategory(
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url'])!,
      recipeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}recipe_id'])!,
    );
  }

  @override
  $WidgetCategoriesTable createAlias(String alias) {
    return $WidgetCategoriesTable(attachedDatabase, alias);
  }
}

class WidgetCategory extends DataClass implements Insertable<WidgetCategory> {
  final String name;
  final String imageUrl;
  final String recipeId;
  const WidgetCategory(
      {required this.name, required this.imageUrl, required this.recipeId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['image_url'] = Variable<String>(imageUrl);
    map['recipe_id'] = Variable<String>(recipeId);
    return map;
  }

  WidgetCategoriesCompanion toCompanion(bool nullToAbsent) {
    return WidgetCategoriesCompanion(
      name: Value(name),
      imageUrl: Value(imageUrl),
      recipeId: Value(recipeId),
    );
  }

  factory WidgetCategory.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WidgetCategory(
      name: serializer.fromJson<String>(json['name']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      recipeId: serializer.fromJson<String>(json['recipeId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'recipeId': serializer.toJson<String>(recipeId),
    };
  }

  WidgetCategory copyWith({String? name, String? imageUrl, String? recipeId}) =>
      WidgetCategory(
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        recipeId: recipeId ?? this.recipeId,
      );
  WidgetCategory copyWithCompanion(WidgetCategoriesCompanion data) {
    return WidgetCategory(
      name: data.name.present ? data.name.value : this.name,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WidgetCategory(')
          ..write('name: $name, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('recipeId: $recipeId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, imageUrl, recipeId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WidgetCategory &&
          other.name == this.name &&
          other.imageUrl == this.imageUrl &&
          other.recipeId == this.recipeId);
}

class WidgetCategoriesCompanion extends UpdateCompanion<WidgetCategory> {
  final Value<String> name;
  final Value<String> imageUrl;
  final Value<String> recipeId;
  final Value<int> rowid;
  const WidgetCategoriesCompanion({
    this.name = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.recipeId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WidgetCategoriesCompanion.insert({
    required String name,
    required String imageUrl,
    required String recipeId,
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        imageUrl = Value(imageUrl),
        recipeId = Value(recipeId);
  static Insertable<WidgetCategory> custom({
    Expression<String>? name,
    Expression<String>? imageUrl,
    Expression<String>? recipeId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (imageUrl != null) 'image_url': imageUrl,
      if (recipeId != null) 'recipe_id': recipeId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WidgetCategoriesCompanion copyWith(
      {Value<String>? name,
      Value<String>? imageUrl,
      Value<String>? recipeId,
      Value<int>? rowid}) {
    return WidgetCategoriesCompanion(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      recipeId: recipeId ?? this.recipeId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<String>(recipeId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WidgetCategoriesCompanion(')
          ..write('name: $name, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('recipeId: $recipeId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ScreenCategoriesTable extends ScreenCategories
    with TableInfo<$ScreenCategoriesTable, ScreenCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScreenCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idCategoryMeta =
      const VerificationMeta('idCategory');
  @override
  late final GeneratedColumn<String> idCategory = GeneratedColumn<String>(
      'id_category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _strCategoryMeta =
      const VerificationMeta('strCategory');
  @override
  late final GeneratedColumn<String> strCategory = GeneratedColumn<String>(
      'str_category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _strCategoryThumbMeta =
      const VerificationMeta('strCategoryThumb');
  @override
  late final GeneratedColumn<String> strCategoryThumb = GeneratedColumn<String>(
      'str_category_thumb', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _strCategoryDescriptionMeta =
      const VerificationMeta('strCategoryDescription');
  @override
  late final GeneratedColumn<String> strCategoryDescription =
      GeneratedColumn<String>('str_category_description', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [idCategory, strCategory, strCategoryThumb, strCategoryDescription];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'screen_categories';
  @override
  VerificationContext validateIntegrity(Insertable<ScreenCategory> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_category')) {
      context.handle(
          _idCategoryMeta,
          idCategory.isAcceptableOrUnknown(
              data['id_category']!, _idCategoryMeta));
    } else if (isInserting) {
      context.missing(_idCategoryMeta);
    }
    if (data.containsKey('str_category')) {
      context.handle(
          _strCategoryMeta,
          strCategory.isAcceptableOrUnknown(
              data['str_category']!, _strCategoryMeta));
    } else if (isInserting) {
      context.missing(_strCategoryMeta);
    }
    if (data.containsKey('str_category_thumb')) {
      context.handle(
          _strCategoryThumbMeta,
          strCategoryThumb.isAcceptableOrUnknown(
              data['str_category_thumb']!, _strCategoryThumbMeta));
    } else if (isInserting) {
      context.missing(_strCategoryThumbMeta);
    }
    if (data.containsKey('str_category_description')) {
      context.handle(
          _strCategoryDescriptionMeta,
          strCategoryDescription.isAcceptableOrUnknown(
              data['str_category_description']!, _strCategoryDescriptionMeta));
    } else if (isInserting) {
      context.missing(_strCategoryDescriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idCategory};
  @override
  ScreenCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScreenCategory(
      idCategory: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id_category'])!,
      strCategory: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}str_category'])!,
      strCategoryThumb: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}str_category_thumb'])!,
      strCategoryDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}str_category_description'])!,
    );
  }

  @override
  $ScreenCategoriesTable createAlias(String alias) {
    return $ScreenCategoriesTable(attachedDatabase, alias);
  }
}

class ScreenCategory extends DataClass implements Insertable<ScreenCategory> {
  final String idCategory;
  final String strCategory;
  final String strCategoryThumb;
  final String strCategoryDescription;
  const ScreenCategory(
      {required this.idCategory,
      required this.strCategory,
      required this.strCategoryThumb,
      required this.strCategoryDescription});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_category'] = Variable<String>(idCategory);
    map['str_category'] = Variable<String>(strCategory);
    map['str_category_thumb'] = Variable<String>(strCategoryThumb);
    map['str_category_description'] = Variable<String>(strCategoryDescription);
    return map;
  }

  ScreenCategoriesCompanion toCompanion(bool nullToAbsent) {
    return ScreenCategoriesCompanion(
      idCategory: Value(idCategory),
      strCategory: Value(strCategory),
      strCategoryThumb: Value(strCategoryThumb),
      strCategoryDescription: Value(strCategoryDescription),
    );
  }

  factory ScreenCategory.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScreenCategory(
      idCategory: serializer.fromJson<String>(json['idCategory']),
      strCategory: serializer.fromJson<String>(json['strCategory']),
      strCategoryThumb: serializer.fromJson<String>(json['strCategoryThumb']),
      strCategoryDescription:
          serializer.fromJson<String>(json['strCategoryDescription']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idCategory': serializer.toJson<String>(idCategory),
      'strCategory': serializer.toJson<String>(strCategory),
      'strCategoryThumb': serializer.toJson<String>(strCategoryThumb),
      'strCategoryDescription':
          serializer.toJson<String>(strCategoryDescription),
    };
  }

  ScreenCategory copyWith(
          {String? idCategory,
          String? strCategory,
          String? strCategoryThumb,
          String? strCategoryDescription}) =>
      ScreenCategory(
        idCategory: idCategory ?? this.idCategory,
        strCategory: strCategory ?? this.strCategory,
        strCategoryThumb: strCategoryThumb ?? this.strCategoryThumb,
        strCategoryDescription:
            strCategoryDescription ?? this.strCategoryDescription,
      );
  ScreenCategory copyWithCompanion(ScreenCategoriesCompanion data) {
    return ScreenCategory(
      idCategory:
          data.idCategory.present ? data.idCategory.value : this.idCategory,
      strCategory:
          data.strCategory.present ? data.strCategory.value : this.strCategory,
      strCategoryThumb: data.strCategoryThumb.present
          ? data.strCategoryThumb.value
          : this.strCategoryThumb,
      strCategoryDescription: data.strCategoryDescription.present
          ? data.strCategoryDescription.value
          : this.strCategoryDescription,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScreenCategory(')
          ..write('idCategory: $idCategory, ')
          ..write('strCategory: $strCategory, ')
          ..write('strCategoryThumb: $strCategoryThumb, ')
          ..write('strCategoryDescription: $strCategoryDescription')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      idCategory, strCategory, strCategoryThumb, strCategoryDescription);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScreenCategory &&
          other.idCategory == this.idCategory &&
          other.strCategory == this.strCategory &&
          other.strCategoryThumb == this.strCategoryThumb &&
          other.strCategoryDescription == this.strCategoryDescription);
}

class ScreenCategoriesCompanion extends UpdateCompanion<ScreenCategory> {
  final Value<String> idCategory;
  final Value<String> strCategory;
  final Value<String> strCategoryThumb;
  final Value<String> strCategoryDescription;
  final Value<int> rowid;
  const ScreenCategoriesCompanion({
    this.idCategory = const Value.absent(),
    this.strCategory = const Value.absent(),
    this.strCategoryThumb = const Value.absent(),
    this.strCategoryDescription = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ScreenCategoriesCompanion.insert({
    required String idCategory,
    required String strCategory,
    required String strCategoryThumb,
    required String strCategoryDescription,
    this.rowid = const Value.absent(),
  })  : idCategory = Value(idCategory),
        strCategory = Value(strCategory),
        strCategoryThumb = Value(strCategoryThumb),
        strCategoryDescription = Value(strCategoryDescription);
  static Insertable<ScreenCategory> custom({
    Expression<String>? idCategory,
    Expression<String>? strCategory,
    Expression<String>? strCategoryThumb,
    Expression<String>? strCategoryDescription,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idCategory != null) 'id_category': idCategory,
      if (strCategory != null) 'str_category': strCategory,
      if (strCategoryThumb != null) 'str_category_thumb': strCategoryThumb,
      if (strCategoryDescription != null)
        'str_category_description': strCategoryDescription,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ScreenCategoriesCompanion copyWith(
      {Value<String>? idCategory,
      Value<String>? strCategory,
      Value<String>? strCategoryThumb,
      Value<String>? strCategoryDescription,
      Value<int>? rowid}) {
    return ScreenCategoriesCompanion(
      idCategory: idCategory ?? this.idCategory,
      strCategory: strCategory ?? this.strCategory,
      strCategoryThumb: strCategoryThumb ?? this.strCategoryThumb,
      strCategoryDescription:
          strCategoryDescription ?? this.strCategoryDescription,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idCategory.present) {
      map['id_category'] = Variable<String>(idCategory.value);
    }
    if (strCategory.present) {
      map['str_category'] = Variable<String>(strCategory.value);
    }
    if (strCategoryThumb.present) {
      map['str_category_thumb'] = Variable<String>(strCategoryThumb.value);
    }
    if (strCategoryDescription.present) {
      map['str_category_description'] =
          Variable<String>(strCategoryDescription.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScreenCategoriesCompanion(')
          ..write('idCategory: $idCategory, ')
          ..write('strCategory: $strCategory, ')
          ..write('strCategoryThumb: $strCategoryThumb, ')
          ..write('strCategoryDescription: $strCategoryDescription, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CuisinesTable extends Cuisines with TableInfo<$CuisinesTable, Cuisine> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CuisinesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, imageUrl];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cuisines';
  @override
  VerificationContext validateIntegrity(Insertable<Cuisine> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Cuisine map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Cuisine(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url']),
    );
  }

  @override
  $CuisinesTable createAlias(String alias) {
    return $CuisinesTable(attachedDatabase, alias);
  }
}

class Cuisine extends DataClass implements Insertable<Cuisine> {
  final String id;
  final String name;
  final String? imageUrl;
  const Cuisine({required this.id, required this.name, this.imageUrl});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    return map;
  }

  CuisinesCompanion toCompanion(bool nullToAbsent) {
    return CuisinesCompanion(
      id: Value(id),
      name: Value(name),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
    );
  }

  factory Cuisine.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Cuisine(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'imageUrl': serializer.toJson<String?>(imageUrl),
    };
  }

  Cuisine copyWith(
          {String? id,
          String? name,
          Value<String?> imageUrl = const Value.absent()}) =>
      Cuisine(
        id: id ?? this.id,
        name: name ?? this.name,
        imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
      );
  Cuisine copyWithCompanion(CuisinesCompanion data) {
    return Cuisine(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Cuisine(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, imageUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Cuisine &&
          other.id == this.id &&
          other.name == this.name &&
          other.imageUrl == this.imageUrl);
}

class CuisinesCompanion extends UpdateCompanion<Cuisine> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> imageUrl;
  final Value<int> rowid;
  const CuisinesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CuisinesCompanion.insert({
    required String id,
    required String name,
    this.imageUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name);
  static Insertable<Cuisine> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? imageUrl,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (imageUrl != null) 'image_url': imageUrl,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CuisinesCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? imageUrl,
      Value<int>? rowid}) {
    return CuisinesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CuisinesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CuisineRecipesTable extends CuisineRecipes
    with TableInfo<$CuisineRecipesTable, CuisineRecipe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CuisineRecipesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMealMeta = const VerificationMeta('idMeal');
  @override
  late final GeneratedColumn<String> idMeal = GeneratedColumn<String>(
      'id_meal', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _strMealMeta =
      const VerificationMeta('strMeal');
  @override
  late final GeneratedColumn<String> strMeal = GeneratedColumn<String>(
      'str_meal', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _strMealThumbMeta =
      const VerificationMeta('strMealThumb');
  @override
  late final GeneratedColumn<String> strMealThumb = GeneratedColumn<String>(
      'str_meal_thumb', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [idMeal, strMeal, strMealThumb];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cuisine_recipes';
  @override
  VerificationContext validateIntegrity(Insertable<CuisineRecipe> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_meal')) {
      context.handle(_idMealMeta,
          idMeal.isAcceptableOrUnknown(data['id_meal']!, _idMealMeta));
    } else if (isInserting) {
      context.missing(_idMealMeta);
    }
    if (data.containsKey('str_meal')) {
      context.handle(_strMealMeta,
          strMeal.isAcceptableOrUnknown(data['str_meal']!, _strMealMeta));
    } else if (isInserting) {
      context.missing(_strMealMeta);
    }
    if (data.containsKey('str_meal_thumb')) {
      context.handle(
          _strMealThumbMeta,
          strMealThumb.isAcceptableOrUnknown(
              data['str_meal_thumb']!, _strMealThumbMeta));
    } else if (isInserting) {
      context.missing(_strMealThumbMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idMeal};
  @override
  CuisineRecipe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CuisineRecipe(
      idMeal: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id_meal'])!,
      strMeal: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}str_meal'])!,
      strMealThumb: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}str_meal_thumb'])!,
    );
  }

  @override
  $CuisineRecipesTable createAlias(String alias) {
    return $CuisineRecipesTable(attachedDatabase, alias);
  }
}

class CuisineRecipe extends DataClass implements Insertable<CuisineRecipe> {
  final String idMeal;
  final String strMeal;
  final String strMealThumb;
  const CuisineRecipe(
      {required this.idMeal,
      required this.strMeal,
      required this.strMealThumb});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_meal'] = Variable<String>(idMeal);
    map['str_meal'] = Variable<String>(strMeal);
    map['str_meal_thumb'] = Variable<String>(strMealThumb);
    return map;
  }

  CuisineRecipesCompanion toCompanion(bool nullToAbsent) {
    return CuisineRecipesCompanion(
      idMeal: Value(idMeal),
      strMeal: Value(strMeal),
      strMealThumb: Value(strMealThumb),
    );
  }

  factory CuisineRecipe.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CuisineRecipe(
      idMeal: serializer.fromJson<String>(json['idMeal']),
      strMeal: serializer.fromJson<String>(json['strMeal']),
      strMealThumb: serializer.fromJson<String>(json['strMealThumb']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idMeal': serializer.toJson<String>(idMeal),
      'strMeal': serializer.toJson<String>(strMeal),
      'strMealThumb': serializer.toJson<String>(strMealThumb),
    };
  }

  CuisineRecipe copyWith(
          {String? idMeal, String? strMeal, String? strMealThumb}) =>
      CuisineRecipe(
        idMeal: idMeal ?? this.idMeal,
        strMeal: strMeal ?? this.strMeal,
        strMealThumb: strMealThumb ?? this.strMealThumb,
      );
  CuisineRecipe copyWithCompanion(CuisineRecipesCompanion data) {
    return CuisineRecipe(
      idMeal: data.idMeal.present ? data.idMeal.value : this.idMeal,
      strMeal: data.strMeal.present ? data.strMeal.value : this.strMeal,
      strMealThumb: data.strMealThumb.present
          ? data.strMealThumb.value
          : this.strMealThumb,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CuisineRecipe(')
          ..write('idMeal: $idMeal, ')
          ..write('strMeal: $strMeal, ')
          ..write('strMealThumb: $strMealThumb')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idMeal, strMeal, strMealThumb);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CuisineRecipe &&
          other.idMeal == this.idMeal &&
          other.strMeal == this.strMeal &&
          other.strMealThumb == this.strMealThumb);
}

class CuisineRecipesCompanion extends UpdateCompanion<CuisineRecipe> {
  final Value<String> idMeal;
  final Value<String> strMeal;
  final Value<String> strMealThumb;
  final Value<int> rowid;
  const CuisineRecipesCompanion({
    this.idMeal = const Value.absent(),
    this.strMeal = const Value.absent(),
    this.strMealThumb = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CuisineRecipesCompanion.insert({
    required String idMeal,
    required String strMeal,
    required String strMealThumb,
    this.rowid = const Value.absent(),
  })  : idMeal = Value(idMeal),
        strMeal = Value(strMeal),
        strMealThumb = Value(strMealThumb);
  static Insertable<CuisineRecipe> custom({
    Expression<String>? idMeal,
    Expression<String>? strMeal,
    Expression<String>? strMealThumb,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idMeal != null) 'id_meal': idMeal,
      if (strMeal != null) 'str_meal': strMeal,
      if (strMealThumb != null) 'str_meal_thumb': strMealThumb,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CuisineRecipesCompanion copyWith(
      {Value<String>? idMeal,
      Value<String>? strMeal,
      Value<String>? strMealThumb,
      Value<int>? rowid}) {
    return CuisineRecipesCompanion(
      idMeal: idMeal ?? this.idMeal,
      strMeal: strMeal ?? this.strMeal,
      strMealThumb: strMealThumb ?? this.strMealThumb,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idMeal.present) {
      map['id_meal'] = Variable<String>(idMeal.value);
    }
    if (strMeal.present) {
      map['str_meal'] = Variable<String>(strMeal.value);
    }
    if (strMealThumb.present) {
      map['str_meal_thumb'] = Variable<String>(strMealThumb.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CuisineRecipesCompanion(')
          ..write('idMeal: $idMeal, ')
          ..write('strMeal: $strMeal, ')
          ..write('strMealThumb: $strMealThumb, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FavoriteRecipesTable favoriteRecipes =
      $FavoriteRecipesTable(this);
  late final $CachedRecipesTable cachedRecipes = $CachedRecipesTable(this);
  late final $WidgetCategoriesTable widgetCategories =
      $WidgetCategoriesTable(this);
  late final $ScreenCategoriesTable screenCategories =
      $ScreenCategoriesTable(this);
  late final $CuisinesTable cuisines = $CuisinesTable(this);
  late final $CuisineRecipesTable cuisineRecipes = $CuisineRecipesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        favoriteRecipes,
        cachedRecipes,
        widgetCategories,
        screenCategories,
        cuisines,
        cuisineRecipes
      ];
}

typedef $$FavoriteRecipesTableCreateCompanionBuilder = FavoriteRecipesCompanion
    Function({
  required String idMeal,
  required String strMeal,
  Value<String?> strMealThumb,
  Value<String?> strInstructions,
  Value<String?> strSource,
  Value<String?> strCategory,
  Value<String?> strArea,
  Value<String?> strYoutube,
  Value<String?> ingredientsJson,
  Value<int> rowid,
});
typedef $$FavoriteRecipesTableUpdateCompanionBuilder = FavoriteRecipesCompanion
    Function({
  Value<String> idMeal,
  Value<String> strMeal,
  Value<String?> strMealThumb,
  Value<String?> strInstructions,
  Value<String?> strSource,
  Value<String?> strCategory,
  Value<String?> strArea,
  Value<String?> strYoutube,
  Value<String?> ingredientsJson,
  Value<int> rowid,
});

class $$FavoriteRecipesTableFilterComposer
    extends Composer<_$AppDatabase, $FavoriteRecipesTable> {
  $$FavoriteRecipesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get idMeal => $composableBuilder(
      column: $table.idMeal, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get strMeal => $composableBuilder(
      column: $table.strMeal, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get strMealThumb => $composableBuilder(
      column: $table.strMealThumb, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get strInstructions => $composableBuilder(
      column: $table.strInstructions,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get strSource => $composableBuilder(
      column: $table.strSource, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get strCategory => $composableBuilder(
      column: $table.strCategory, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get strArea => $composableBuilder(
      column: $table.strArea, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get strYoutube => $composableBuilder(
      column: $table.strYoutube, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get ingredientsJson => $composableBuilder(
      column: $table.ingredientsJson,
      builder: (column) => ColumnFilters(column));
}

class $$FavoriteRecipesTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoriteRecipesTable> {
  $$FavoriteRecipesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get idMeal => $composableBuilder(
      column: $table.idMeal, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get strMeal => $composableBuilder(
      column: $table.strMeal, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get strMealThumb => $composableBuilder(
      column: $table.strMealThumb,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get strInstructions => $composableBuilder(
      column: $table.strInstructions,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get strSource => $composableBuilder(
      column: $table.strSource, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get strCategory => $composableBuilder(
      column: $table.strCategory, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get strArea => $composableBuilder(
      column: $table.strArea, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get strYoutube => $composableBuilder(
      column: $table.strYoutube, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get ingredientsJson => $composableBuilder(
      column: $table.ingredientsJson,
      builder: (column) => ColumnOrderings(column));
}

class $$FavoriteRecipesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoriteRecipesTable> {
  $$FavoriteRecipesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get idMeal =>
      $composableBuilder(column: $table.idMeal, builder: (column) => column);

  GeneratedColumn<String> get strMeal =>
      $composableBuilder(column: $table.strMeal, builder: (column) => column);

  GeneratedColumn<String> get strMealThumb => $composableBuilder(
      column: $table.strMealThumb, builder: (column) => column);

  GeneratedColumn<String> get strInstructions => $composableBuilder(
      column: $table.strInstructions, builder: (column) => column);

  GeneratedColumn<String> get strSource =>
      $composableBuilder(column: $table.strSource, builder: (column) => column);

  GeneratedColumn<String> get strCategory => $composableBuilder(
      column: $table.strCategory, builder: (column) => column);

  GeneratedColumn<String> get strArea =>
      $composableBuilder(column: $table.strArea, builder: (column) => column);

  GeneratedColumn<String> get strYoutube => $composableBuilder(
      column: $table.strYoutube, builder: (column) => column);

  GeneratedColumn<String> get ingredientsJson => $composableBuilder(
      column: $table.ingredientsJson, builder: (column) => column);
}

class $$FavoriteRecipesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FavoriteRecipesTable,
    FavoriteRecipe,
    $$FavoriteRecipesTableFilterComposer,
    $$FavoriteRecipesTableOrderingComposer,
    $$FavoriteRecipesTableAnnotationComposer,
    $$FavoriteRecipesTableCreateCompanionBuilder,
    $$FavoriteRecipesTableUpdateCompanionBuilder,
    (
      FavoriteRecipe,
      BaseReferences<_$AppDatabase, $FavoriteRecipesTable, FavoriteRecipe>
    ),
    FavoriteRecipe,
    PrefetchHooks Function()> {
  $$FavoriteRecipesTableTableManager(
      _$AppDatabase db, $FavoriteRecipesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoriteRecipesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoriteRecipesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoriteRecipesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> idMeal = const Value.absent(),
            Value<String> strMeal = const Value.absent(),
            Value<String?> strMealThumb = const Value.absent(),
            Value<String?> strInstructions = const Value.absent(),
            Value<String?> strSource = const Value.absent(),
            Value<String?> strCategory = const Value.absent(),
            Value<String?> strArea = const Value.absent(),
            Value<String?> strYoutube = const Value.absent(),
            Value<String?> ingredientsJson = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FavoriteRecipesCompanion(
            idMeal: idMeal,
            strMeal: strMeal,
            strMealThumb: strMealThumb,
            strInstructions: strInstructions,
            strSource: strSource,
            strCategory: strCategory,
            strArea: strArea,
            strYoutube: strYoutube,
            ingredientsJson: ingredientsJson,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String idMeal,
            required String strMeal,
            Value<String?> strMealThumb = const Value.absent(),
            Value<String?> strInstructions = const Value.absent(),
            Value<String?> strSource = const Value.absent(),
            Value<String?> strCategory = const Value.absent(),
            Value<String?> strArea = const Value.absent(),
            Value<String?> strYoutube = const Value.absent(),
            Value<String?> ingredientsJson = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FavoriteRecipesCompanion.insert(
            idMeal: idMeal,
            strMeal: strMeal,
            strMealThumb: strMealThumb,
            strInstructions: strInstructions,
            strSource: strSource,
            strCategory: strCategory,
            strArea: strArea,
            strYoutube: strYoutube,
            ingredientsJson: ingredientsJson,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FavoriteRecipesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FavoriteRecipesTable,
    FavoriteRecipe,
    $$FavoriteRecipesTableFilterComposer,
    $$FavoriteRecipesTableOrderingComposer,
    $$FavoriteRecipesTableAnnotationComposer,
    $$FavoriteRecipesTableCreateCompanionBuilder,
    $$FavoriteRecipesTableUpdateCompanionBuilder,
    (
      FavoriteRecipe,
      BaseReferences<_$AppDatabase, $FavoriteRecipesTable, FavoriteRecipe>
    ),
    FavoriteRecipe,
    PrefetchHooks Function()>;
typedef $$CachedRecipesTableCreateCompanionBuilder = CachedRecipesCompanion
    Function({
  required String idMeal,
  required String strMeal,
  Value<String?> strMealThumb,
  Value<String?> strInstructions,
  Value<String?> strSource,
  Value<String?> strCategory,
  Value<String?> strArea,
  Value<String?> strYoutube,
  Value<String?> ingredientsJson,
  Value<int?> viewedAt,
  Value<int> rowid,
});
typedef $$CachedRecipesTableUpdateCompanionBuilder = CachedRecipesCompanion
    Function({
  Value<String> idMeal,
  Value<String> strMeal,
  Value<String?> strMealThumb,
  Value<String?> strInstructions,
  Value<String?> strSource,
  Value<String?> strCategory,
  Value<String?> strArea,
  Value<String?> strYoutube,
  Value<String?> ingredientsJson,
  Value<int?> viewedAt,
  Value<int> rowid,
});

class $$CachedRecipesTableFilterComposer
    extends Composer<_$AppDatabase, $CachedRecipesTable> {
  $$CachedRecipesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get idMeal => $composableBuilder(
      column: $table.idMeal, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get strMeal => $composableBuilder(
      column: $table.strMeal, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get strMealThumb => $composableBuilder(
      column: $table.strMealThumb, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get strInstructions => $composableBuilder(
      column: $table.strInstructions,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get strSource => $composableBuilder(
      column: $table.strSource, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get strCategory => $composableBuilder(
      column: $table.strCategory, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get strArea => $composableBuilder(
      column: $table.strArea, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get strYoutube => $composableBuilder(
      column: $table.strYoutube, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get ingredientsJson => $composableBuilder(
      column: $table.ingredientsJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get viewedAt => $composableBuilder(
      column: $table.viewedAt, builder: (column) => ColumnFilters(column));
}

class $$CachedRecipesTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedRecipesTable> {
  $$CachedRecipesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get idMeal => $composableBuilder(
      column: $table.idMeal, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get strMeal => $composableBuilder(
      column: $table.strMeal, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get strMealThumb => $composableBuilder(
      column: $table.strMealThumb,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get strInstructions => $composableBuilder(
      column: $table.strInstructions,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get strSource => $composableBuilder(
      column: $table.strSource, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get strCategory => $composableBuilder(
      column: $table.strCategory, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get strArea => $composableBuilder(
      column: $table.strArea, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get strYoutube => $composableBuilder(
      column: $table.strYoutube, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get ingredientsJson => $composableBuilder(
      column: $table.ingredientsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get viewedAt => $composableBuilder(
      column: $table.viewedAt, builder: (column) => ColumnOrderings(column));
}

class $$CachedRecipesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedRecipesTable> {
  $$CachedRecipesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get idMeal =>
      $composableBuilder(column: $table.idMeal, builder: (column) => column);

  GeneratedColumn<String> get strMeal =>
      $composableBuilder(column: $table.strMeal, builder: (column) => column);

  GeneratedColumn<String> get strMealThumb => $composableBuilder(
      column: $table.strMealThumb, builder: (column) => column);

  GeneratedColumn<String> get strInstructions => $composableBuilder(
      column: $table.strInstructions, builder: (column) => column);

  GeneratedColumn<String> get strSource =>
      $composableBuilder(column: $table.strSource, builder: (column) => column);

  GeneratedColumn<String> get strCategory => $composableBuilder(
      column: $table.strCategory, builder: (column) => column);

  GeneratedColumn<String> get strArea =>
      $composableBuilder(column: $table.strArea, builder: (column) => column);

  GeneratedColumn<String> get strYoutube => $composableBuilder(
      column: $table.strYoutube, builder: (column) => column);

  GeneratedColumn<String> get ingredientsJson => $composableBuilder(
      column: $table.ingredientsJson, builder: (column) => column);

  GeneratedColumn<int> get viewedAt =>
      $composableBuilder(column: $table.viewedAt, builder: (column) => column);
}

class $$CachedRecipesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CachedRecipesTable,
    CachedRecipe,
    $$CachedRecipesTableFilterComposer,
    $$CachedRecipesTableOrderingComposer,
    $$CachedRecipesTableAnnotationComposer,
    $$CachedRecipesTableCreateCompanionBuilder,
    $$CachedRecipesTableUpdateCompanionBuilder,
    (
      CachedRecipe,
      BaseReferences<_$AppDatabase, $CachedRecipesTable, CachedRecipe>
    ),
    CachedRecipe,
    PrefetchHooks Function()> {
  $$CachedRecipesTableTableManager(_$AppDatabase db, $CachedRecipesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedRecipesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedRecipesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedRecipesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> idMeal = const Value.absent(),
            Value<String> strMeal = const Value.absent(),
            Value<String?> strMealThumb = const Value.absent(),
            Value<String?> strInstructions = const Value.absent(),
            Value<String?> strSource = const Value.absent(),
            Value<String?> strCategory = const Value.absent(),
            Value<String?> strArea = const Value.absent(),
            Value<String?> strYoutube = const Value.absent(),
            Value<String?> ingredientsJson = const Value.absent(),
            Value<int?> viewedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedRecipesCompanion(
            idMeal: idMeal,
            strMeal: strMeal,
            strMealThumb: strMealThumb,
            strInstructions: strInstructions,
            strSource: strSource,
            strCategory: strCategory,
            strArea: strArea,
            strYoutube: strYoutube,
            ingredientsJson: ingredientsJson,
            viewedAt: viewedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String idMeal,
            required String strMeal,
            Value<String?> strMealThumb = const Value.absent(),
            Value<String?> strInstructions = const Value.absent(),
            Value<String?> strSource = const Value.absent(),
            Value<String?> strCategory = const Value.absent(),
            Value<String?> strArea = const Value.absent(),
            Value<String?> strYoutube = const Value.absent(),
            Value<String?> ingredientsJson = const Value.absent(),
            Value<int?> viewedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedRecipesCompanion.insert(
            idMeal: idMeal,
            strMeal: strMeal,
            strMealThumb: strMealThumb,
            strInstructions: strInstructions,
            strSource: strSource,
            strCategory: strCategory,
            strArea: strArea,
            strYoutube: strYoutube,
            ingredientsJson: ingredientsJson,
            viewedAt: viewedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CachedRecipesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CachedRecipesTable,
    CachedRecipe,
    $$CachedRecipesTableFilterComposer,
    $$CachedRecipesTableOrderingComposer,
    $$CachedRecipesTableAnnotationComposer,
    $$CachedRecipesTableCreateCompanionBuilder,
    $$CachedRecipesTableUpdateCompanionBuilder,
    (
      CachedRecipe,
      BaseReferences<_$AppDatabase, $CachedRecipesTable, CachedRecipe>
    ),
    CachedRecipe,
    PrefetchHooks Function()>;
typedef $$WidgetCategoriesTableCreateCompanionBuilder
    = WidgetCategoriesCompanion Function({
  required String name,
  required String imageUrl,
  required String recipeId,
  Value<int> rowid,
});
typedef $$WidgetCategoriesTableUpdateCompanionBuilder
    = WidgetCategoriesCompanion Function({
  Value<String> name,
  Value<String> imageUrl,
  Value<String> recipeId,
  Value<int> rowid,
});

class $$WidgetCategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $WidgetCategoriesTable> {
  $$WidgetCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get recipeId => $composableBuilder(
      column: $table.recipeId, builder: (column) => ColumnFilters(column));
}

class $$WidgetCategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $WidgetCategoriesTable> {
  $$WidgetCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get recipeId => $composableBuilder(
      column: $table.recipeId, builder: (column) => ColumnOrderings(column));
}

class $$WidgetCategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $WidgetCategoriesTable> {
  $$WidgetCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get recipeId =>
      $composableBuilder(column: $table.recipeId, builder: (column) => column);
}

class $$WidgetCategoriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WidgetCategoriesTable,
    WidgetCategory,
    $$WidgetCategoriesTableFilterComposer,
    $$WidgetCategoriesTableOrderingComposer,
    $$WidgetCategoriesTableAnnotationComposer,
    $$WidgetCategoriesTableCreateCompanionBuilder,
    $$WidgetCategoriesTableUpdateCompanionBuilder,
    (
      WidgetCategory,
      BaseReferences<_$AppDatabase, $WidgetCategoriesTable, WidgetCategory>
    ),
    WidgetCategory,
    PrefetchHooks Function()> {
  $$WidgetCategoriesTableTableManager(
      _$AppDatabase db, $WidgetCategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WidgetCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WidgetCategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WidgetCategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> name = const Value.absent(),
            Value<String> imageUrl = const Value.absent(),
            Value<String> recipeId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WidgetCategoriesCompanion(
            name: name,
            imageUrl: imageUrl,
            recipeId: recipeId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String name,
            required String imageUrl,
            required String recipeId,
            Value<int> rowid = const Value.absent(),
          }) =>
              WidgetCategoriesCompanion.insert(
            name: name,
            imageUrl: imageUrl,
            recipeId: recipeId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WidgetCategoriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WidgetCategoriesTable,
    WidgetCategory,
    $$WidgetCategoriesTableFilterComposer,
    $$WidgetCategoriesTableOrderingComposer,
    $$WidgetCategoriesTableAnnotationComposer,
    $$WidgetCategoriesTableCreateCompanionBuilder,
    $$WidgetCategoriesTableUpdateCompanionBuilder,
    (
      WidgetCategory,
      BaseReferences<_$AppDatabase, $WidgetCategoriesTable, WidgetCategory>
    ),
    WidgetCategory,
    PrefetchHooks Function()>;
typedef $$ScreenCategoriesTableCreateCompanionBuilder
    = ScreenCategoriesCompanion Function({
  required String idCategory,
  required String strCategory,
  required String strCategoryThumb,
  required String strCategoryDescription,
  Value<int> rowid,
});
typedef $$ScreenCategoriesTableUpdateCompanionBuilder
    = ScreenCategoriesCompanion Function({
  Value<String> idCategory,
  Value<String> strCategory,
  Value<String> strCategoryThumb,
  Value<String> strCategoryDescription,
  Value<int> rowid,
});

class $$ScreenCategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $ScreenCategoriesTable> {
  $$ScreenCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get idCategory => $composableBuilder(
      column: $table.idCategory, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get strCategory => $composableBuilder(
      column: $table.strCategory, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get strCategoryThumb => $composableBuilder(
      column: $table.strCategoryThumb,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get strCategoryDescription => $composableBuilder(
      column: $table.strCategoryDescription,
      builder: (column) => ColumnFilters(column));
}

class $$ScreenCategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $ScreenCategoriesTable> {
  $$ScreenCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get idCategory => $composableBuilder(
      column: $table.idCategory, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get strCategory => $composableBuilder(
      column: $table.strCategory, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get strCategoryThumb => $composableBuilder(
      column: $table.strCategoryThumb,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get strCategoryDescription => $composableBuilder(
      column: $table.strCategoryDescription,
      builder: (column) => ColumnOrderings(column));
}

class $$ScreenCategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ScreenCategoriesTable> {
  $$ScreenCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get idCategory => $composableBuilder(
      column: $table.idCategory, builder: (column) => column);

  GeneratedColumn<String> get strCategory => $composableBuilder(
      column: $table.strCategory, builder: (column) => column);

  GeneratedColumn<String> get strCategoryThumb => $composableBuilder(
      column: $table.strCategoryThumb, builder: (column) => column);

  GeneratedColumn<String> get strCategoryDescription => $composableBuilder(
      column: $table.strCategoryDescription, builder: (column) => column);
}

class $$ScreenCategoriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ScreenCategoriesTable,
    ScreenCategory,
    $$ScreenCategoriesTableFilterComposer,
    $$ScreenCategoriesTableOrderingComposer,
    $$ScreenCategoriesTableAnnotationComposer,
    $$ScreenCategoriesTableCreateCompanionBuilder,
    $$ScreenCategoriesTableUpdateCompanionBuilder,
    (
      ScreenCategory,
      BaseReferences<_$AppDatabase, $ScreenCategoriesTable, ScreenCategory>
    ),
    ScreenCategory,
    PrefetchHooks Function()> {
  $$ScreenCategoriesTableTableManager(
      _$AppDatabase db, $ScreenCategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScreenCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ScreenCategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ScreenCategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> idCategory = const Value.absent(),
            Value<String> strCategory = const Value.absent(),
            Value<String> strCategoryThumb = const Value.absent(),
            Value<String> strCategoryDescription = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ScreenCategoriesCompanion(
            idCategory: idCategory,
            strCategory: strCategory,
            strCategoryThumb: strCategoryThumb,
            strCategoryDescription: strCategoryDescription,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String idCategory,
            required String strCategory,
            required String strCategoryThumb,
            required String strCategoryDescription,
            Value<int> rowid = const Value.absent(),
          }) =>
              ScreenCategoriesCompanion.insert(
            idCategory: idCategory,
            strCategory: strCategory,
            strCategoryThumb: strCategoryThumb,
            strCategoryDescription: strCategoryDescription,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ScreenCategoriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ScreenCategoriesTable,
    ScreenCategory,
    $$ScreenCategoriesTableFilterComposer,
    $$ScreenCategoriesTableOrderingComposer,
    $$ScreenCategoriesTableAnnotationComposer,
    $$ScreenCategoriesTableCreateCompanionBuilder,
    $$ScreenCategoriesTableUpdateCompanionBuilder,
    (
      ScreenCategory,
      BaseReferences<_$AppDatabase, $ScreenCategoriesTable, ScreenCategory>
    ),
    ScreenCategory,
    PrefetchHooks Function()>;
typedef $$CuisinesTableCreateCompanionBuilder = CuisinesCompanion Function({
  required String id,
  required String name,
  Value<String?> imageUrl,
  Value<int> rowid,
});
typedef $$CuisinesTableUpdateCompanionBuilder = CuisinesCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String?> imageUrl,
  Value<int> rowid,
});

class $$CuisinesTableFilterComposer
    extends Composer<_$AppDatabase, $CuisinesTable> {
  $$CuisinesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));
}

class $$CuisinesTableOrderingComposer
    extends Composer<_$AppDatabase, $CuisinesTable> {
  $$CuisinesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));
}

class $$CuisinesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CuisinesTable> {
  $$CuisinesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);
}

class $$CuisinesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CuisinesTable,
    Cuisine,
    $$CuisinesTableFilterComposer,
    $$CuisinesTableOrderingComposer,
    $$CuisinesTableAnnotationComposer,
    $$CuisinesTableCreateCompanionBuilder,
    $$CuisinesTableUpdateCompanionBuilder,
    (Cuisine, BaseReferences<_$AppDatabase, $CuisinesTable, Cuisine>),
    Cuisine,
    PrefetchHooks Function()> {
  $$CuisinesTableTableManager(_$AppDatabase db, $CuisinesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CuisinesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CuisinesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CuisinesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CuisinesCompanion(
            id: id,
            name: name,
            imageUrl: imageUrl,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> imageUrl = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CuisinesCompanion.insert(
            id: id,
            name: name,
            imageUrl: imageUrl,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CuisinesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CuisinesTable,
    Cuisine,
    $$CuisinesTableFilterComposer,
    $$CuisinesTableOrderingComposer,
    $$CuisinesTableAnnotationComposer,
    $$CuisinesTableCreateCompanionBuilder,
    $$CuisinesTableUpdateCompanionBuilder,
    (Cuisine, BaseReferences<_$AppDatabase, $CuisinesTable, Cuisine>),
    Cuisine,
    PrefetchHooks Function()>;
typedef $$CuisineRecipesTableCreateCompanionBuilder = CuisineRecipesCompanion
    Function({
  required String idMeal,
  required String strMeal,
  required String strMealThumb,
  Value<int> rowid,
});
typedef $$CuisineRecipesTableUpdateCompanionBuilder = CuisineRecipesCompanion
    Function({
  Value<String> idMeal,
  Value<String> strMeal,
  Value<String> strMealThumb,
  Value<int> rowid,
});

class $$CuisineRecipesTableFilterComposer
    extends Composer<_$AppDatabase, $CuisineRecipesTable> {
  $$CuisineRecipesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get idMeal => $composableBuilder(
      column: $table.idMeal, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get strMeal => $composableBuilder(
      column: $table.strMeal, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get strMealThumb => $composableBuilder(
      column: $table.strMealThumb, builder: (column) => ColumnFilters(column));
}

class $$CuisineRecipesTableOrderingComposer
    extends Composer<_$AppDatabase, $CuisineRecipesTable> {
  $$CuisineRecipesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get idMeal => $composableBuilder(
      column: $table.idMeal, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get strMeal => $composableBuilder(
      column: $table.strMeal, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get strMealThumb => $composableBuilder(
      column: $table.strMealThumb,
      builder: (column) => ColumnOrderings(column));
}

class $$CuisineRecipesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CuisineRecipesTable> {
  $$CuisineRecipesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get idMeal =>
      $composableBuilder(column: $table.idMeal, builder: (column) => column);

  GeneratedColumn<String> get strMeal =>
      $composableBuilder(column: $table.strMeal, builder: (column) => column);

  GeneratedColumn<String> get strMealThumb => $composableBuilder(
      column: $table.strMealThumb, builder: (column) => column);
}

class $$CuisineRecipesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CuisineRecipesTable,
    CuisineRecipe,
    $$CuisineRecipesTableFilterComposer,
    $$CuisineRecipesTableOrderingComposer,
    $$CuisineRecipesTableAnnotationComposer,
    $$CuisineRecipesTableCreateCompanionBuilder,
    $$CuisineRecipesTableUpdateCompanionBuilder,
    (
      CuisineRecipe,
      BaseReferences<_$AppDatabase, $CuisineRecipesTable, CuisineRecipe>
    ),
    CuisineRecipe,
    PrefetchHooks Function()> {
  $$CuisineRecipesTableTableManager(
      _$AppDatabase db, $CuisineRecipesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CuisineRecipesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CuisineRecipesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CuisineRecipesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> idMeal = const Value.absent(),
            Value<String> strMeal = const Value.absent(),
            Value<String> strMealThumb = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CuisineRecipesCompanion(
            idMeal: idMeal,
            strMeal: strMeal,
            strMealThumb: strMealThumb,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String idMeal,
            required String strMeal,
            required String strMealThumb,
            Value<int> rowid = const Value.absent(),
          }) =>
              CuisineRecipesCompanion.insert(
            idMeal: idMeal,
            strMeal: strMeal,
            strMealThumb: strMealThumb,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CuisineRecipesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CuisineRecipesTable,
    CuisineRecipe,
    $$CuisineRecipesTableFilterComposer,
    $$CuisineRecipesTableOrderingComposer,
    $$CuisineRecipesTableAnnotationComposer,
    $$CuisineRecipesTableCreateCompanionBuilder,
    $$CuisineRecipesTableUpdateCompanionBuilder,
    (
      CuisineRecipe,
      BaseReferences<_$AppDatabase, $CuisineRecipesTable, CuisineRecipe>
    ),
    CuisineRecipe,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FavoriteRecipesTableTableManager get favoriteRecipes =>
      $$FavoriteRecipesTableTableManager(_db, _db.favoriteRecipes);
  $$CachedRecipesTableTableManager get cachedRecipes =>
      $$CachedRecipesTableTableManager(_db, _db.cachedRecipes);
  $$WidgetCategoriesTableTableManager get widgetCategories =>
      $$WidgetCategoriesTableTableManager(_db, _db.widgetCategories);
  $$ScreenCategoriesTableTableManager get screenCategories =>
      $$ScreenCategoriesTableTableManager(_db, _db.screenCategories);
  $$CuisinesTableTableManager get cuisines =>
      $$CuisinesTableTableManager(_db, _db.cuisines);
  $$CuisineRecipesTableTableManager get cuisineRecipes =>
      $$CuisineRecipesTableTableManager(_db, _db.cuisineRecipes);
}
