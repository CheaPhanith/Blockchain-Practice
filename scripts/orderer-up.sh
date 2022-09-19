export PATH=${PWD}/bin:$PATH
export ORDERER_FILELEDGER_LOCATION=../ledger/
export FABRIC_LOGGING_SPEC=INFO
export FABRIC_CFG_PATH=${PWD}/config
export ORDERER_GENERAL_LISTENADDRESS=127.0.0.1
export ORDERER_GENERAL_GENESISMETHOD=file
export CORE_PEER_TLS_ENABLED=true
export ORDERER_GENERAL_GENESISFILE=${PWD}/artifacts/genesis.block
export ORDERER_GENERAL_LOCALMSPID="OrdererMSP"
export CORE_PEER_MSPCONFIGPATH=${PWD}/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
export ORDERER_GENERAL_LOCALMSPDIR=${PWD}/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp
export ORDERER_GENERAL_TLS_PRIVATEKEY=${PWD}/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/tls/server.key
export ORDERER_GENERAL_TLS_CERTIFICATE=${PWD}/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/tls/server.crt
export ORDERER_GENERAL_TLS_ROOTCAS=[${PWD}/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/tls/ca.crt]

orderer