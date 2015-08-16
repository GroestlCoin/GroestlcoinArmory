////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Copyright (C) 2011-2015, Armory Technologies, Inc.                        //
//  Distributed under the GNU Affero General Public License (AGPL v3)         //
//  See LICENSE or http://www.gnu.org/licenses/agpl.html                      //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

#include "BtcUtils.h"

extern "C" {
#include "sphlib/sph_groestl.h"	//GRS
}

const BinaryData BtcUtils::BadAddress_ = BinaryData::CreateFromHex("0000000000000000000000000000000000000000");
const BinaryData BtcUtils::EmptyHash_  = BinaryData::CreateFromHex("0000000000000000000000000000000000000000000000000000000000000000");


BinaryData BtcUtils::getGroestlHash(uint8_t const * strToHash, uint32_t nBytes) {
    sph_groestl512_context  ctx_gr[2];
    static unsigned char pblank[1];
    uint8_t hash1[64];
	
    sph_groestl512_init(&ctx_gr[0]);
    sph_groestl512 (&ctx_gr[0], strToHash ? strToHash : pblank, nBytes);
    sph_groestl512_close(&ctx_gr[0], hash1);
	
	uint8_t hash2[64];
	sph_groestl512_init(&ctx_gr[1]);
	sph_groestl512(&ctx_gr[1], hash1, 64);
	sph_groestl512_close(&ctx_gr[1], hash2);

	return BinaryData(hash2, 32);
}






