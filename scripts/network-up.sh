export PATH=${PWD}/bin
export FABRIC_CFG_PATH=${PWD}/config
cryptogen generate --output="crypto-config" --config=./crypto-config.yaml
configtxgen -outputBlock ./artifacts/genesis.block -profile TwoOrgsGenesis -channelID mygenesis

configtxgen -inspectBlock ./artifacts/genesis.block > ./temp/genesis.json
configtxgen -outputCreateChannelTx ./artifacts/sys-channel.tx -profile TwoOrgsChannel -channelID mychannel
configtxgen -outputAnchorPeersUpdate ./artifacts/Org1Anchor.tx -profile TwoOrgsChannel -channelID mychannel -asOrg Org1
configtxgen -outputAnchorPeersUpdate ./artifacts/Org2Anchor.tx -profile TwoOrgsChannel -channelID mychannel -asOrg Org2