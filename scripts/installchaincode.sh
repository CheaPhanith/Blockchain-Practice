export CORE_PEER_TLS_ENABLED=true
export ORDERER_CA=${PWD}/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
export PRIVATE_DATA_CONFIG=${PWD}/bin/colllections_config.json
export PATH=${PWD}/bin:$PATH
export FABRIC_CFG_PATH=$PWD/config
CA1=${PWD}/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
CA2=${PWD}/crypto-config/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt
CHANNEL_NAME=mychannel
CC_NAME="mycc"
VERSION=1
PACKAGE_ID=mycc:b21d98bea70da2018fd64321beb848df2a52b6143406f612f2422f23a52561da


# Identity set to Admin
setGlobalsForPeer0Org1(){
export CORE_PEER_MSPCONFIGPATH=${PWD}/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
export CORE_PEER_LOCALMSPID="Org1MSP"
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
export CORE_TLS_KEY_FILE=${PWD}/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/server.key
export CORE_TLS_CERT_FILE=${PWD}/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/server.crt
peer lifecycle chaincode install mycc.tar.gz --peerAddresses localhost:7051 --tlsRootCertFiles $CA1
}


# peer lifecycle chaincode queryinstalled >&log.txt
# cat log.txt
# CC_PACKAGE_ID=$(sed -n "/${CC_NAME}_${VERSION}/{s/^Package ID: //; s/, Label:.*$//;p;}" log.txt )

approveformyorg1(){
    setGlobalsForPeer0Org1
    peer lifecycle chaincode approveformyorg -o localhost:7050 \
        --tls true \
        --cafile $ORDERER_CA --channelID $CHANNEL_NAME --name ${CC_NAME} \
        --collections-config $PRIVATE_DATA_CONFIG \
        --version 1 --package-id ${PACKAGE_ID} --sequence 1
}

setGlobalsForPeer0Org2(){
export CORE_PEER_ID="Org2MSP"
export CORE_PEER_MSPCONFIGPATH=${PWD}/crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp
export ORDERER_CA=${PWD}/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
export CORE_PEER_ADDRESS=localhost:7053
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/crypto-config/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt
export CORE_TLS_KEY_FILE=${PWD}/crypto-config/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/server.key
export CORE_TLS_CERT_FILE=${PWD}/crypto-config/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/server.crt
peer lifecycle chaincode install mycc.tar.gz --peerAddresses localhost:7053  --tlsRootCertFiles $CA2
}

approveformyorg2(){
    setGlobalsForPeer0Org2
    peer lifecycle chaincode approveformyorg -o localhost:7050 \
        --tls true \
        --cafile $ORDERER_CA --channelID $CHANNEL_NAME --name ${CC_NAME} \
        --collections-config $PRIVATE_DATA_CONFIG \
        --version 1 --package-id ${PACKAGE_ID} --sequence 1
}

# approveformyorg1


setGlobalsForPeer0Org1
# peer lifecycle chaincode checkcommitreadiness \
#         --channelID $CHANNEL_NAME --name mycc --version 1 \
#         --sequence 1 --output json --init-required


# --collections-config $PRIVATE_DATA_CONFIG 



#Org2
# export CORE_PEER_ID="Org2MSP"
# export CORE_PEER_LOCALMSPID="Org2MSP"
# export CORE_PEER_ADDRESS=localhost:7053
# export CORE_PEER_MSPCONFIGPATH=${PWD}/crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp
# peer lifecycle chaincode install mycc.tar.gz --peerAddresses localhost:7053 --tlsRootCertFiles $CA2
# peer lifecycle chaincode queryinstalled --peerAddresses localhost:7053 --tlsRootCertFiles $CA2