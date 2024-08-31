-----------------------------------------------------------------
-- Autogenerated by Thrift
--
-- DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
--  @generated
-----------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE BangPatterns #-}
{-# OPTIONS_GHC -fno-warn-unused-imports#-}
{-# OPTIONS_GHC -fno-warn-overlapping-patterns#-}
{-# OPTIONS_GHC -fno-warn-incomplete-patterns#-}
{-# OPTIONS_GHC -fno-warn-incomplete-uni-patterns#-}
{-# OPTIONS_GHC -fno-warn-incomplete-record-updates#-}
{-# LANGUAGE GADTs #-}
module Namespace.E.TU__Service.Service
       (TU__ServiceCommand(..), reqName', reqParser', respWriter',
        methodsInfo')
       where
import qualified Control.Exception as Exception
import qualified Control.Monad.ST.Trans as ST
import qualified Control.Monad.Trans.Class as Trans
import qualified Data.ByteString.Builder as Builder
import qualified Data.Default as Default
import qualified Data.HashMap.Strict as HashMap
import qualified Data.Int as Int
import qualified Data.Map.Strict as Map
import qualified Data.Proxy as Proxy
import qualified Data.Text as Text
import qualified Namespace.E.Types as Types
import qualified Prelude as Prelude
import qualified Thrift.Binary.Parser as Parser
import qualified Thrift.Codegen as Thrift
import qualified Thrift.Processor as Thrift
import qualified Thrift.Protocol.ApplicationException.Types
       as Thrift
import Control.Applicative ((<*), (*>))
import Data.Monoid ((<>))
import Prelude ((<$>), (<*>), (++), (.), (==))

data TU__ServiceCommand a where
  GetNumber :: Int.Int32 -> TU__ServiceCommand Types.TU__Type
  DoNothing :: TU__ServiceCommand ()

instance Thrift.Processor TU__ServiceCommand where
  reqName = reqName'
  reqParser = reqParser'
  respWriter = respWriter'
  methodsInfo _ = methodsInfo'

reqName' :: TU__ServiceCommand a -> Text.Text
reqName' (GetNumber __field__x) = "getNumber"
reqName' DoNothing = "doNothing"

reqParser' ::
             Thrift.Protocol p =>
             Proxy.Proxy p ->
               Text.Text -> Parser.Parser (Thrift.Some TU__ServiceCommand)
reqParser' _proxy "getNumber"
  = ST.runSTT
      (do Prelude.return ()
          __field__x <- ST.newSTRef Default.def
          let
            _parse _lastId
              = do _fieldBegin <- Trans.lift
                                    (Thrift.parseFieldBegin _proxy _lastId _idMap)
                   case _fieldBegin of
                     Thrift.FieldBegin _type _id _bool -> do case _id of
                                                               1 | _type == Thrift.getI32Type _proxy
                                                                   ->
                                                                   do !_val <- Trans.lift
                                                                                 (Thrift.parseI32
                                                                                    _proxy)
                                                                      ST.writeSTRef __field__x _val
                                                               _ -> Trans.lift
                                                                      (Thrift.parseSkip _proxy _type
                                                                         (Prelude.Just _bool))
                                                             _parse _id
                     Thrift.FieldEnd -> do !__val__x <- ST.readSTRef __field__x
                                           Prelude.pure (Thrift.Some (GetNumber __val__x))
            _idMap = HashMap.fromList [("x", 1)]
          _parse 0)
reqParser' _proxy "doNothing"
  = ST.runSTT
      (do Prelude.return ()
          let
            _parse _lastId
              = do _fieldBegin <- Trans.lift
                                    (Thrift.parseFieldBegin _proxy _lastId _idMap)
                   case _fieldBegin of
                     Thrift.FieldBegin _type _id _bool -> do case _id of
                                                               _ -> Trans.lift
                                                                      (Thrift.parseSkip _proxy _type
                                                                         (Prelude.Just _bool))
                                                             _parse _id
                     Thrift.FieldEnd -> do Prelude.pure (Thrift.Some DoNothing)
            _idMap = HashMap.fromList []
          _parse 0)
reqParser' _ funName
  = Prelude.errorWithoutStackTrace
      ("unknown function call: " ++ Text.unpack funName)

respWriter' ::
              Thrift.Protocol p =>
              Proxy.Proxy p ->
                Int.Int32 ->
                  TU__ServiceCommand a ->
                    Prelude.Either Exception.SomeException a ->
                      (Builder.Builder,
                       Prelude.Maybe (Exception.SomeException, Thrift.Blame))
respWriter' _proxy _seqNum GetNumber{} _r
  = (Thrift.genMsgBegin _proxy "getNumber" _msgType _seqNum <>
       _msgBody
       <> Thrift.genMsgEnd _proxy,
     _msgException)
  where
    (_msgType, _msgBody, _msgException)
      = case _r of
          Prelude.Left _ex | Prelude.Just
                               _e@Thrift.ApplicationException{} <- Exception.fromException _ex
                             ->
                             (3, Thrift.buildStruct _proxy _e,
                              Prelude.Just (_ex, Thrift.ServerError))
                           | Prelude.otherwise ->
                             let _e
                                   = Thrift.ApplicationException (Text.pack (Prelude.show _ex))
                                       Thrift.ApplicationExceptionType_InternalError
                               in
                               (3, Thrift.buildStruct _proxy _e,
                                Prelude.Just (Exception.toException _e, Thrift.ServerError))
          Prelude.Right _result -> (2,
                                    Thrift.genStruct _proxy
                                      [Thrift.genField _proxy "" (Thrift.getI64Type _proxy) 0 0
                                         (Thrift.genI64 _proxy _result)],
                                    Prelude.Nothing)
respWriter' _proxy _seqNum DoNothing{} _r
  = (Thrift.genMsgBegin _proxy "doNothing" _msgType _seqNum <>
       _msgBody
       <> Thrift.genMsgEnd _proxy,
     _msgException)
  where
    (_msgType, _msgBody, _msgException)
      = case _r of
          Prelude.Left _ex | Prelude.Just
                               _e@Thrift.ApplicationException{} <- Exception.fromException _ex
                             ->
                             (3, Thrift.buildStruct _proxy _e,
                              Prelude.Just (_ex, Thrift.ServerError))
                           | Prelude.Just _e@Types.TU__Exception{} <- Exception.fromException
                                                                        _ex
                             ->
                             (2,
                              Thrift.genStruct _proxy
                                [Thrift.genField _proxy "ex" (Thrift.getStructType _proxy) 1 0
                                   (Thrift.buildStruct _proxy _e)],
                              Prelude.Just (_ex, Thrift.ClientError))
                           | Prelude.otherwise ->
                             let _e
                                   = Thrift.ApplicationException (Text.pack (Prelude.show _ex))
                                       Thrift.ApplicationExceptionType_InternalError
                               in
                               (3, Thrift.buildStruct _proxy _e,
                                Prelude.Just (Exception.toException _e, Thrift.ServerError))
          Prelude.Right _result -> (2, Thrift.genStruct _proxy [],
                                    Prelude.Nothing)

methodsInfo' :: Map.Map Text.Text Thrift.MethodInfo
methodsInfo'
  = Map.fromList
      [("getNumber",
        Thrift.MethodInfo Thrift.NormalPriority Prelude.False),
       ("doNothing",
        Thrift.MethodInfo Thrift.NormalPriority Prelude.False)]