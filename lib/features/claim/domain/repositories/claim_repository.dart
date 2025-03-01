import 'package:dartz/dartz.dart';
import 'package:lost_and_found/features/claim/domain/entities/claim_received.dart';
import 'package:lost_and_found/features/item/domain/entities/item.dart' as item;
import 'package:lost_and_found/features/claim/domain/usecases/create_claim_usecase.dart';
import 'package:lost_and_found/features/claim/domain/usecases/insert_read_claim_usecase.dart';
import 'package:lost_and_found/features/claim/domain/usecases/manage_claim_usecase.dart';

import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/status/failures.dart';
import '../../../../core/status/success.dart';
import '../entities/claim_sent.dart';

abstract class ClaimRepository {
  Future<Either<Failure, List<ClaimReceived>>> getReceivedClaims(NoParams params);
  Future<Either<Failure, List<ClaimSent>>> getSentClaims(NoParams params);
  Future<Either<Failure, item.Item>> createClaim(CreateClaimParams params);
  Future<Either<Failure, item.Item>> manageClaim(ManageClaimParams params);
  Future<Either<Failure, Success>> insertReadClaim(InsertReadClaimParams params);
}