{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
module Network.Riak.Protocol.YokozunaIndexGetRequest (YokozunaIndexGetRequest(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
 
data YokozunaIndexGetRequest = YokozunaIndexGetRequest{name :: !(P'.Maybe P'.ByteString)}
                             deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)
 
instance P'.Mergeable YokozunaIndexGetRequest where
  mergeAppend (YokozunaIndexGetRequest x'1) (YokozunaIndexGetRequest y'1) = YokozunaIndexGetRequest (P'.mergeAppend x'1 y'1)
 
instance P'.Default YokozunaIndexGetRequest where
  defaultValue = YokozunaIndexGetRequest P'.defaultValue
 
instance P'.Wire YokozunaIndexGetRequest where
  wireSize ft' self'@(YokozunaIndexGetRequest x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 12 x'1)
  wirePut ft' self'@(YokozunaIndexGetRequest x'1)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 10 12 x'1
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{name = Prelude'.Just new'Field}) (P'.wireGet 12)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> YokozunaIndexGetRequest) YokozunaIndexGetRequest where
  getVal m' f' = f' m'
 
instance P'.GPB YokozunaIndexGetRequest
 
instance P'.ReflectDescriptor YokozunaIndexGetRequest where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Protocol.YokozunaIndexGetRequest\", haskellPrefix = [MName \"Network\",MName \"Riak\"], parentModule = [MName \"Protocol\"], baseName = MName \"YokozunaIndexGetRequest\"}, descFilePath = [\"Network\",\"Riak\",\"Protocol\",\"YokozunaIndexGetRequest.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.YokozunaIndexGetRequest.name\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"YokozunaIndexGetRequest\"], baseName' = FName \"name\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"
 
instance P'.TextType YokozunaIndexGetRequest where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage
 
instance P'.TextMsg YokozunaIndexGetRequest where
  textPut msg
   = do
       P'.tellT "name" (name msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'name]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'name
         = P'.try
            (do
               v <- P'.getT "name"
               Prelude'.return (\ o -> o{name = v}))