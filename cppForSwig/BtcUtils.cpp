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
    std::array<uint8_t, 64> hash1;
	
    sph_groestl512_init(&ctx_gr[0]);
    sph_groestl512 (&ctx_gr[0], strToHash ? strToHash : pblank, nBytes);
    sph_groestl512_close(&ctx_gr[0], static_cast<void*>(hash1.data()));
	
	std::array<uint8_t, 64> hash2;
	sph_groestl512_init(&ctx_gr[1]);
	sph_groestl512(&ctx_gr[1],static_cast<const void*>(hash1.data()), 64);
	sph_groestl512_close(&ctx_gr[1],static_cast<void*>(hash2.data()));

	BinaryData	r(32);
	memcpy(r.getPtr(), hash2.data(), 32);
	return r;


}






