export PATH=${PWD}/bin:$PATH
export FABRIC_CFG_PATH=${PWD}/config/
export CORE_PEER_ID="Org1MSP"
export CORE_PEER_TLS_ENABLED=true
CA1=${PWD}/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
export CORE_PEER_LOCALMSPID="Org1MSP"
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
export ORDERER_CA=${PWD}/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
peer lifecycle chaincode package mycc.tar.gz --path ./chaincode --lang golang --label mycc --tls --cafile $ORDERER_CA 
peer lifecycle chaincode install mycc.tar.gz --peerAddresses localhost:7051  --tlsRootCertFiles $CA1
peer lifecycle chaincode queryinstalled >&log.txt
cat log.txt
CC_PACKAGE_ID=$(sed -n "/${CC_NAME}_${VERSION}/{s/^Package ID: //; s/, Label:.*$//;p;}" log.txt )








# peer lifecycle chaincode approveformyorg  -o localhost:7050 --channelID mychannel --name mycc --version 1.0 --init-required --package-id ${PACKAGE_ID} --sequence 1 \
# --signature-policy "AND ('Org1MSP.peer','Org2MSP.peer')"