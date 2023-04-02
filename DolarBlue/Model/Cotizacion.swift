//
//  Cotizacion.swift
//  DolarBlue
//
//  Created by Ricardo CORIN on 3/31/23.
//

import Foundation
import SwiftUI

struct Casa: Hashable, Codable {
    var agencia: String
    var nombre: String
    var compra: String
    var venta: String
    var variacion: String?
	
	var nombre_oficial : String {
		if nombre == "Dolar Blue" {
			return NSLocalizedString("Blue Dollar", comment: "")
		} else if nombre == "Dolar Oficial" {
			return NSLocalizedString("Official Dollar", comment: "")
		} else {
			return nombre
		}
	}
	var compra_currency : String {
		let val = Double(compra.replacingOccurrences(of: ",", with: ".")) ?? 0
		let valp = "$"+String(Int(val))
		return valp
	}

	var venta_currency : String {
		let val = Double(venta.replacingOccurrences(of: ",", with: ".")) ?? 0
		let valp = "$"+String(Int(val))
		return valp
	}

	var variacion_sign: Int {
		if variacion == nil {
			return -1
		} else {
			let d : Double? = Double(variacion!.replacingOccurrences(of: ",", with: "."))
			if d == nil || d == 0{
				return 0
			} else if d! < 0 {
				return -1
			} else if d! > 0 {
				return 1
			}
		}
		return 0
	}
	
	var cotizacion: String {
		return compra_currency + " — " + venta_currency
	}
	
	var height: Double {
		return (1.0 - (Double(venta.replacingOccurrences(of: ",", with: ".")) ?? 0)  / 1000.0)
	}
	
}

struct Cotizacion: Hashable, Codable {
	var casa: Casa
}
