// LoginState.swift
// AdvancedTechniquesLab
//
// Created by Ethan Allgaier on 1/5/26
//
import Foundation

enum loginState {
  case idle
  case loading
  case success(String)
  case failure(String)
}
