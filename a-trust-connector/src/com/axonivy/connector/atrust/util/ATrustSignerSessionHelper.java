package com.axonivy.connector.atrust.util;

import com.axonivy.connector.atrust.restricted.SignatureResult;
import com.axonivy.connector.atrust.restricted.SignatureSessionContainer;

import ch.ivyteam.ivy.environment.Ivy;

public class ATrustSignerSessionHelper {
		private static final String sessionKeyContainer = "atrust_signer_container_session_key";
		private static final String sessionKeyResult = "atrust_signer_result_session_key";
		
		/**
		 * Store internal data container object to session
		 * 
		 * @param signatureResult
		 */
		public static void saveToSession( SignatureSessionContainer sessionContainer ) {
			Ivy.session().setAttribute(sessionKeyContainer, sessionContainer);
		}
		
		/**
		 * Store signer result data to session
		 * 
		 * @param signatureResult
		 */
		public static void saveToSession( SignatureResult signatureResult ) {
			Ivy.session().setAttribute(sessionKeyResult, signatureResult);
		}		
		
		/**
		 * Remove signer result and internal container object from session.
		 */
		public static void clearSessionData() {
			Ivy.session().removeAttribute(sessionKeyContainer);
			Ivy.session().removeAttribute(sessionKeyResult);			
		}
		
		/**
		 * Get internal container object from session. Returns null, if no data is present.
		 * 
		 * @return Data object or NULL, if no object is present in session.
		 */
		public static SignatureSessionContainer getContainerObjectFromSession() {
			Object o = Ivy.session().getAttribute(sessionKeyContainer);
			
			if( o != null && o instanceof SignatureSessionContainer ) {
				return (SignatureSessionContainer)o;
			}
			
			return null;
		}
		
		/**
		 * Get signer result data from session. Returns null, if no data is present.
		 * 
		 * @return Data object or NULL, if no object is present in session.
		 */
		public static SignatureResult getSignatureResultFromSession() {
			Object o = Ivy.session().getAttribute(sessionKeyResult);
			
			if( o != null && o instanceof SignatureResult ) {
				return (SignatureResult)o;
			}
			
			return null;
		}
}
