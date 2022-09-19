# # Environment variables for PEER0
# export PATH=${PWD}/bin:$PATH
# export FABRIC_CFG_PATH=${PWD}/config/
export CHANNEL_NAME=mychannel
export caFile=/home/pop/blockchain/Blockchain-Practice/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
# export CORE_PEER_TLS_ENABLED=true
# export ORDERER_CA=${PWD}/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem

createChannelTx(){
export PATH=${PWD}/bin:$PATH
export FABRIC_CFG_PATH=${PWD}/config
export CORE_PEER_TLS_ENABLED=true
export ORDERER_CA=${PWD}/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem

export CORE_PEER_LOCALMSPID="Org1MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
export CORE_PEER_ADDRESS=localhost:7051
export CHANNEL_NAME=mychannel
    peer channel create -o localhost:7050  -c $CHANNEL_NAME -f ./artifacts/sys-channel.tx --tls --cafile /home/pop/blockchain/Blockchain-Practice/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
}

createChannelTx


