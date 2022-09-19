PACKAGE_ID="mycc:b21d98bea70da2018fd64321beb848df2a52b6143406f612f2422f23a52561da"
export PATH=${PWD}/bin:$PATH
export FABRIC_CFG_PATH=${PWD}/config/
export CORE_PEER_ID="Org1MSP"
export CORE_PEER_LOCALMSPID="Org1MSP"
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_MSPCONFIGPATH=${PWD}/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}crypto-config/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/tls/ca.crt
export ORDERER_GENERAL_LOCALMSPDIR=${PWD}/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp
peer lifecycle chaincode install mycc.tar.gz --peerAddresses localhost:7051
peer lifecycle chaincode queryinstalled --peerAddresses localhost:7051
peer lifecycle chaincode approveformyorg  -o localhost:7050 --channelID mychannel --name mycc --version 1 --init-required --package-id $PACKAGE_ID --sequence 1 